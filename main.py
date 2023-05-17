from discord.ext import commands
import threading

tokens_file = "tokens.txt"
threads = []

def login(token):
    bot = commands.Bot(command_prefix="!", self_bot=True)
    bot.run(token)

with open(tokens_file, "r") as f:
    for line in f:
        token = line.strip()
        thread = threading.Thread(target=login, args=(token,))
        thread.start()
        threads.append(thread)

for thread in threads:
    thread.join()
