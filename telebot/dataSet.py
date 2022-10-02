import csv
import os
from venv import create


class Topics:
    def createTopic():
        cw = csv.writer(open("topics.csv", "w"))
        data = [
            "How to create a Python package in 2022",
            "https://mathspp.com/blog/how-to-create-a-python-package-in-2022",
        ]
        with open("topics.csv", "w", encoding="UTF8") as f:
            writer = csv.writer(f)
            # write the data
            writer.writerow(data)

    def getTopic():
        topics = []
        if not os.path.exists("./topics.csv"):
            Topics.createTopic()
        with open("./topics.csv", "r") as file:
            csvreader = csv.reader(file)
            for row in csvreader:
                topics.append({"title": row[0], "link": row[1]})

        return topics

    def addTopic(title, link):
        data = [title, link]
        with open("topics.csv", "a", encoding="UTF8") as f:
            writer = csv.writer(f)
            writer.writerow(data)


