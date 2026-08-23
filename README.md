# Kratos

A Flutter project for creating and tracking Powerlifting (and other weight training) programs. Named for the Greek god of strength and power, not necessarily the video game character.

## App organization

Kratos uses a hierarchy to help you manage training prorams, mesocycles, schedules, and individual workouts.

- `Program` : The top-level structure in Kratos is called a `program`.
  A `program` is a long-term approach to training.
  - `Mesocyle` : Each `program` contains one or more predefined `mesocycles,` which define a specific training progression over time.
    - `Week` : In Kratos, the `week` is the unit of time for progression through a `mesocycle`.
    A `mesocycle` is made up of one or more weeks, where each week is contains a series of `workouts`.
      - `Workout` : A `workout` is a specific list of `exercises` to be performed (in order) in one training session.
        - `Set` : For each `exercise` in a workout, there are a list of one or more `sets`.
        A `set` specifies a weight, a number of repetitions, and an RPE (rate of perceived exertion).

  - `Schedule` : A schedule places a `program`'s `mesocycle`(s) into actual calendar days, defining the order and repetition of `mesocycles`, as well as specific days for the `workouts` within those `mesocycles`.
- `Exercise` : A single training technique executed during a workout.
An `exercise` exists outside of `programs`, and is instead included in one or more `workouts` of a `program`.

## Code Notes

The app code is organized by a few high-level folders.
Idea is to mostly fit into an MVC framework, with a couple extra bits:

- `components/` : For generalized custom components used in the view. Like base classes for view elements.
- `controller/` : For classes implementing the bulk of the logic for operations in the app.
- `fonts/` : This came with the starter code, guess it's where font files go.
- `model/` : For classes representing the underlying data models in the app. Mostly dumb structs.
- `pages/` : For the different pages of the app, and navigation between them. Like dumb structs wrapping view components together.
- `view/` : For components that display models, and bind functionality from controllers.
- `utils.js` : For random utility functions used across parts of the code.

Below are details of what we have in each of the `model-view-controller` folders.

### Model Details

There are classes to represent each of the key members of the hierarchy listed in `App Organization`:

- `Program`
- `Mesocyle`
- `Week`
- `Workout`
- `Set`
- `Schedule`
- `Exercise`

Each of these can exist as a template, or an instance. An instance can be planned, active, or completed.
The state affects how the class is displayed.
For example, a planned workout shows up in the future schedule.
An active workout is shown in the active workout view.
A completed workout shows up in the history view or in the past schedule.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
