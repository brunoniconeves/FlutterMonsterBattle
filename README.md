# FullStack Labs Challange

I've made this code challange for a Sr. Flutter position at Fullstack Labs

# Flutter Coding Challenge - Battle of Monsters

## Introduction

You will create a screen recording video of yourself completing the challenge, then send me a link to the file via Google Drive. A few things to consider:

- We ask that you complete this challenge within the timeframe agreed on in our conversation.
- **You MUST NOT edit your video, stop it and continue later, use a second screen, copy contents from hidden screens, or anything similar that can be considered cheating. The recording must be without stopping and with no editing.**
- **You MUST show your operating system clock during the entire recording. Please, do not maximize your screen in a way your operating system clock is hidden. Always keep it visible.**
- You can use screen recording software like Loom, QuickTime, or something similar, to create the video.
- The recording should be of the entire coding challenge, from the beginning to end, which is about 70 minutes.
    - **You will use 45 minutes for the coding challenge and 25 minutes for the problem-solving challenge.**
    - Remember to record the coding challenge and the problem-solving challenge **together in just one video**; please **do not stop/play and join the video**; if you do it, you will be disqualified.
    - You can spend more than 45 minutes on the coding challenge, but we will discount points on your challenge. But please, be careful with the 25 minutes limit on the problem-solving challenge; you should avoid spending more than the time limit.
- You should record your entire screen so we can validate your implementation correctly. **Also, your computer clock should be visible in the entire video.**
- Please upload the video file to Google Drive and share an open link with us (we support .mp4, files smaller/with less than 4gb).
- As you complete the challenge, please explain what you are doing. Walk us through your thinking, explain your decisions, etc. Show us your UI work, if applicable.
- Here is a short clip from a recent coding challenge, as an example of what your recording should look like: [Example video](http://www.loom.com/share/85434243d487456b8ef4ae45c3fbc788). It is from a React challenge, but it is the same for any challenge.

## The Coding Challenge

### Getting Started

Hi! Welcome to the Flutter coding challenge! We want to check your Flutter knowledge by giving you an application to finish. We already have an application, but it is incomplete; your goal is to finish this application and make the application usable.

> We have a project structured with a pattern, so the time suggested above can be done following the pattern and splitting your time into categories; a good organization will lead you to finish the challenge successfully!
> 

<aside>
⏳ **Recommended duration for each category in the challenge (this is a suggestion)
  -** **Styling**: 15 minutes
  **- Components creation**: 10 minutes
  **- Services and logic**: 10 minutes
  **- Unit testing**: 10 minutes

*Of course, you can split the time as you want, but we recommend you follow this.*

</aside>

### Instructions

The current application displays a list of monsters. Right now, we only have the feature of selecting the player's monsters; your job is to implement the missing functionalities.
You will have to create the monster's card component so we can visualize the monster's strengths and weaknesses correctly.

After selecting the player's monster, you will have to implement the logic to get the computer's monster, which should be randomly selected, not allowing it to be the same selected as the player; remember that you will select the player's monster by clicking on it.

Once both monsters are selected, the user can “start the battle," and you must implement the service request. We already have an endpoint ready for it. You don't need to worry about the endpoint implementation or even the logic to calculate the monster's battle; your job will be to make the request and display the battle result correctly.

### API

We have a local API configured, you can go to the `server` folder file to check this out.
We have two endpoints, which are the following:

- `GET /monsters`: This endpoint will return all the needed info for the monster's list.
- `POST /battle`: This endpoint will receive a body and return the battle's result.

The `GET /monsters` return the following contract when requested:

```json
[
	{
		"id": "id",
		"name": "Monster 1",
		"attack": 20,
		"defense": 30,
		"hp": 100,
		"speed": 50,
		"type": "Type",
		"imageUrl": "url"
	}
]

```

The `POST /battle` expects to receive a body with the monsters' information; the expected body is the following:

```json
{
	"monster1Id": "monster-1",
	"monster2Id": "monster-2"
}

```

### Running the API Locally

To run the API locally, you need to have installed `Node` on your machine. We recommend you using the version `v16.13.1`, which is the version that we created the app.

To create the API we used the JSON server library, which is pretty simple and help us with the backend for the app.

To install the Node for running the fake backend, you can check [their website](https://nodejs.org/en/) and follow their instructions to install in your specific OS.

> You don’t need to record you installing it and starting the backend, you can start record when you have the environment configured and ready to be worked.
> 

To run the API you should do the following:

```bash
cd server // access the server directory

npm install // install the dependencies

npm start // start the JSON server
```

### IP Address

Depending the emulator you are running, you may have to change the IP address the app will perform the requests; right now we are requesting at `http://[localhost](http://localhost):8000`, in case you didn’t see the monsters list mounting when launching the app **with the server running**, you will have to change to your local IP address (not localhost or 127.0.0.1) inside the project. You can search for localhost and make the replacement on your IDE.

### Technologies

This project is built using the Flutter ecosystem libraries; it is good you know the following items to have a good performance:

- [Dart](https://dart.dev/guides)
- [Flutter](https://docs.flutter.dev/)
- [Provider Package](https://pub.dev/packages/provider)
- [Flutter testing Library](https://docs.flutter.dev/testing/)

### Running Flutter Challenge

- Change the project name to underscore

```bash
flutter create --project-name assessment_cc_flutter_sr_01 .
```

- Get the Flutter's required packages

```
flutter pub get
```

- Run the project

```
flutter run lib/main.dart
```

### Acceptance Criteria

1. Implementation matches the design
2. Tests pass, and coverage has been added to cover the changes and new implementations
3. The computer monster is randomly selected after selecting the player monster
4. The winner's message should be presented after the battle

### Design

You will need to login or create an account in [Figma](https://www.figma.com/)
After that, you will need the following link for the challenge:

- [Figma Design](https://www.figma.com/file/CyCOLe9Tbjzqey3RqPotgE/Battle-of-Monsters---Mobile) *(You can use the "Inspect" tab to see the CSS values)*

**Note**: the *“Inspect”* tab option will just show up if you are logged in; that’s why you need to login or create an account in Figma.

You will have these options after login

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/89d4320b-15b1-4f1b-96df-7c69cc1db04a/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/89d4320b-15b1-4f1b-96df-7c69cc1db04a/Untitled.png)

## The Problem-Solving Challenge

Hi! Welcome to the Dart problem-solving code challenge; we want to test your problem-solving skills here.

You will be provided a repository with some challenges and have to solve them by implementing and making all the created tests pass.

> Please, remember to **NOT USE GOOGLE** to solve the reasoning challenges; try to solve them by yourself.
> 

### Challenges

We will provide three challenges on the repository; you will have a time limit mentioned above minutes to solve them and make them pass the tests.

*If you cannot finish all challenges, send the record with what you solved, and we will evaluate it.*

Remember to solve them using pure Dart, and avoid using libraries or anything that is not your code; we want to see you thinking and solving the challenge.

You can do them in any order, but remember that some challenges are more complex than others.

**At the end of the challenge, run the tests for us before stopping recording. This step is critical; if you forget to do it, it will cause your disqualification.**

### Acceptance Criteria

1. The code should be readable.
2. The code should be easy to maintain.
3. The code should not be complex.
4. All tests should pass.
5. **Tests passing should be shown in the recording (CRITICAL STEP).**

### Challenges folder

- test/challenge-1
- test/challenge-2
- test/challenge-3
