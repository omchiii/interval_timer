# interval_timer
A small interval timer app.

# folder structure inside lib/
*View folder is where all the screens are, in this case there was one screen so there is one folder. Every screen has its own folder, each screen folder has two folders. Page and widgets. Page is the main widget and the widgets inside the widgets folder are its building blocks. 

*Utils folder only includes the SizeConfig.dart file for responsive design.

*Providers folder includes all the providers used, in this case two.

# functionality
1. User can increment or decrement the number of intervals he wants to do. It defaults to one.
2. User can increment or decrement the duration of each training session by one minute, it defaults to one minute(the minimum allowed time).
3. User can increment or decrement the duration of each break session IF he is doing more than one interval, because **it automatically skips the break duration if it ended the training session in the last round**.
4. User can start the counter by pressing the play icon. By pressing the play icon he is automatically disabling all the buttons for incrementing or decrementing the intervals,breaks or training sessions.
5. User can pause the counter, after clicking on play again he can resume it from where it paused.
6. User can stop the counter, which will reset the timer, but not all the settings.
7. If user did not press the play button, the quote will show "lets train", if he did it will show "currently training", or "currently resting" if it is in break session. If the user presses the stop button it will revert back to default "lets train".(it does not change when user pressed the pause button)
8. User can see in which round he is currently in.
9. User can see the motivational quote fetched from the api.

