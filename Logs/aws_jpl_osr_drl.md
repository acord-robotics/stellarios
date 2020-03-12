
Liam ARBUCKLE:slack_call:  6:32 PM
replied to a thread:
Researching successful Deep Racers, they suggest keeping the reward functions simple and spending more time on tweaking the parameters. Any ideas on tweaking this params from PPO? @Liam ARBUCKLE @RISHABH @Mikhail Asavkin ? agent_params = ClippedPPOAgentParameters()…
Let me get this straight:
            if progress >=7 and progress <8:
                # Determine if Rover already received one time reward for reaching this waypoint
                if  not self.reached_waypoint_6:  
                    self.reached_waypoint_6 = False
                    print("Congratulations! The rover has reached waypoint 6!")
                    multiplier = 1 
                    reward = (WAYPOINT_6_REWARD * multiplier)  / self.steps # <-- incentivize to reach way-point in fewest steps
                    return reward, False
Before reaching waypoint 6, the rl-agent's value for the variable "self.reached_waypoint6"  is set to false, so the if not self.reached_waypoint7 is therefore if it has? Just confused me a little bit. Here's the commit for that, https://github.com/EXYNOS-999/AWS_JPL_OSR_DRL/commit/a8615cc83613ceb5f8f1762366527a429182a5c0#diff-007f71bedbc983e8560bc575cd52a5c4
If that is the case, I understand a bit more of the script that I didn't understand before.
BTW, here's some stuff to do with params, as that's still not 100% on the Trello board, and @RISHABH was asking about them earlier today. https://awsjplosrdrl.slack.com/archives/CS800JX25/p1580730303000500

Liam ARBUCKLE
Note: this is parameters from the environment that we can use
Posted in #awsjplosrchallenge | Feb 3rd | View message
View newer replies

http://github.com/exynos-999/AWS_JPL_OSR_DRL
awsjplosrdrl.slack.com

# Pull Requests
https://github.com/EXYNOS-999/AWS_JPL_OSR_DRL/pull/13
