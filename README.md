# Sample Code Repo
This is where you can find the sample code for my guide on automating deployment of a Python based Discord bot. You can find the full guide on my website:

https://vkice.me/posts/discord-python-bot-docker-ecs-aws/

# Files in this Repo

These are the files you can find here free of use:

 - Dockerfile | Definition for the Docker image hosting the Discord Bot
 - bot.py | The Pycord/Python script containing our core Bot code
 - task-definition.json | This is the file used to update the ECS task with our new Docker image
 - bitbucket-pipelines.yml | Definition for the BitBucket pipeline that builds an image from our pushed repository and updates ECR and ECS

# Help me!

If you had any issues following my guide, let me know by creating an issue. Considering the scope of services covered, things may change or look different, or you may get unexpected errors.
