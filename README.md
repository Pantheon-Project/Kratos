# Kratos
A NativeScript app for creating and tracking Powerlifting (and other weight training) programs. Named for the Greek god of strength and power, not necessarily the video game character.

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