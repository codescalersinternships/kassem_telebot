import random
import os


from dataSet import Topics
import telebot

from telebot import types



print("loaded env variables, API_KEY: %s" %os.environ.get('API_KEY'))
bot = telebot.TeleBot(os.environ["API_KEY"])




topics = Topics.getTopic()


markup = types.ReplyKeyboardMarkup(resize_keyboard=True)
markup.add(types.InlineKeyboardButton(text="Read awesome topic", callback_data="/get"))
markup.add(types.InlineKeyboardButton(text="Add new topic", callback_data="/newTopic"))


@bot.message_handler(commands=["start", "help"])
def send_welcome(message):
    bot.reply_to(
        message,
        "Hello, how are you doing?\nDo you want to read awesome topic?",
        reply_markup=markup,
    )


@bot.message_handler(commands=["newTopic", "help"])
def startNewTopic(message):
    sent_msg = bot.send_message(message.chat.id, "enter the title of the topic")
    bot.register_next_step_handler(sent_msg, newTopic)


# @bot.message_handler(commands=["get"])
@bot.message_handler(func=lambda message: True)
def sendTopic(message):
    if message.text == "Read awesome topic":
        try:
            topic = random.choice(topics)
        except:
            topic = topics[0]

        title = topic["title"]
        link = topic["link"]
        bot.send_message(message.chat.id, f" {title} {link}")
    elif message.text == "Add new topic":
        sent_msg = bot.send_message(message.chat.id, "enter the title of the topic")
        bot.register_next_step_handler(sent_msg, newTopic)
    else:
        bot.reply_to(message, "invalid message", reply_markup=markup)


def newTopic(message):
    def getLink(message):
        link = message.text
        if message.text == "cancel" or message.text == "Cancel":
            bot.reply_to(message, "canceled")
            return
        Topics.addTopic(title, link)
        bot.reply_to(message, "topic added")

    if message.text == "cancel" or message.text == "Cancel":
        bot.reply_to(message, "canceled")
        return

    title = message.text
    sent_msg = bot.send_message(
        message.chat.id, f"Topic title is {title}\n please enter the link of the topic"
    )
    bot.register_next_step_handler(sent_msg, getLink)


bot.polling()
