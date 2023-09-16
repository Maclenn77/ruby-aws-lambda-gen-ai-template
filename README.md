#  Ruby + Generative AI - LambdaFunction Application Template 🦾🤖

This is a template for a LambdaFunction application using the Ruby 3.2 runtime. It is designed to handle chat interactions with LLMs and includes various modules and dependencies to facilitate this functionality. It provides a starting point for building serverless applications powered by LLMs using AWS Lambda.

## File Structure

The template has the following file structure:

```
LambdaFunction
|- app.rb
|
|- Gemfile
|
|- lib
|   |- clients
|   |   |- telegram.rb
|   |   |- openai.rb
|   |
|   |- messages
|   |   |- logs.rb
|   |   |
|   |   |- prompts.rb
|   |   |
|   |   |- builder.rb
|   |
|   |- parametizer.rb
|   |- processor.rb
|-events
  |- events.json
```

## Description of Files and Directories

- `app`: This file contains the main `lambda_handler` function, which serves as the entry point for the Lambda function. You can modify this file to define the behavior of your Lambda function.

- `Gemfile`: This file lists the dependencies required by the application. You can add or remove dependencies as needed by modifying this file. There are some commented gems for GenerativeAI

- `lib`: This directory contains various modules and classes that are used by the LambdaFunction.

  - `clients`: This directory contains modules for interacting with external APIs or services. Currently, it includes the `Telegram` and `OpenAI` modules. You can add additional client modules here if needed, or remove current ones.

  - `messages`: This directory contains modules and classes related to handling messages and prompts.

    - `logs.rb`: This filecontains constants for error messages and info messages (`info_messages.rb`). You can modify these files to customize the messages used by your application.

    - `prompts`: This directory contains a variables that define various prompt templates. You can modify this file to add or modify prompt templates as needed.

    - `builder.rb`: This file contains a messages builder class that can be used to construct messages using the defined templates and other parameters.

  - `parametizer.rb`: This file contains a class that is responsible for creating parameters for chat interactions. You can modify this file to customize the parameter creation logic.

  - `processor.rb`: This file contains a class that processes the Lambda event and triggers the appropriate actions based on the event data. You can modify this file to define the processing logic for your application.

## Prerequisites

Before using this application template, make sure you have the following prerequisites installed:

- [AWS CLI](https://aws.amazon.com/cli/)
- [Docker](https://www.docker.com/)
- [SAM CLI](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html)

## Usage

Follow the steps below to deploy and test the application using the SAM CLI:

1. Clone or download this repository to your local machine.

2. Open a terminal or command prompt and navigate to the root directory of the cloned/downloaded repository.

3. Build the application by running the following command:

   ```shell
   sam build --use-container
   ```

4. Deploy the application to AWS Lambda by running the following command:

   ```shell
   sam deploy --guided
   ```

   This command will guide you through the deployment process, allowing you to configure various settings such as the AWS Region, stack name, and any required parameters.

5. Once the deployment is complete, you will receive an output similar to the following:

   ```shell
   Stack deployed successfully!
   ```

6. To test the application, you can invoke the Lambda function using the following command:

   ```shell
   sam local invoke LambdaFunction --event event.json
   ```

   Replace `LambdaFunction` with the actual name of your Lambda function, and `event.json` with the path to a JSON file containing test event data.

   Note: The SAM CLI provides a local testing environment that simulates AWS Lambda and API Gateway.

Congratulations! You have successfully deployed and tested your LambdaFunction application using the SAM CLI.

## Template Configuration

To configure your LambdaFunction application, you can use the following files:

### CloudFormation Template (template.yaml)

The CloudFormation template (template.yaml) defines the AWS resources required for your application. It includes the Lambda function, IAM roles, and any other resources needed to run your application.

You can modify the template.yaml file to customize your application's resources and configurations. Make sure to review the AWS CloudFormation documentation for more information on how to define and configure resources in a CloudFormation template.

### SAM Configuration (samconfig.toml)

The SAM configuration file (samconfig.toml) allows you to specify additional deployment settings for your application. It is used by the SAM CLI during the deployment process.

You can modify the samconfig.toml file to configure settings such as the AWS Region, stack name, and any required parameters. The file is written in TOML (Tom's Obvious, Minimal Language) format.

For example, you can update the samconfig.toml file to specify the AWS Region for deployment:

```toml
version = 0.1
[default]
[default.deploy]
[default.deploy.parameters]
region = "us-west-2"
```

Make sure to review the SAM CLI documentation for more details on how to configure the samconfig.toml file.

## Gems Included

This application template includes the following gems:

- **faraday**: A HTTP client library that provides a simple and elegant way to make HTTP requests.
- **ruby-openai**: A Ruby wrapper for the OpenAI API, allowing you to interact with OpenAI's powerful language models.
- **boxcars**: A library for creating prompt chains inspired by langchain, which helps in generating text using language models.
- **lanchainrb**: A library for creating prompt and chat agents, enabling interactive conversations with language models.

It also includes aws sdks for different AWS Services.


## Additional Resources

- [AWS SAM CLI Documentation](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-command-reference.html)
- [AWS Lambda Developer Guide](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html)
- [Ruby SDK for AWS](https://aws.amazon.com/sdk-for-ruby/)
