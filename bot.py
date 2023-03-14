import discord
import os
from dotenv import load_dotenv

load_dotenv()

bot = discord.Bot(intents=discord.Intents.all())

@bot.slash_command(name="hello",str=None)
async def hello(ctx):
    name = ctx.author.name
    await ctx.respond(f"Hello there, {name}!")

bot.run(os.getenv('TOKEN'))