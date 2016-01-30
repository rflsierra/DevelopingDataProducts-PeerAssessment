##Instructions

###What this app does:

This app calculates the required amount of sample cases to be applied in a poll in order to be able to fill three requirements that are defined by the user: max error allowed, level of confidence and the size of the Universe (the proportion has been set as a fixed value in 50%).

The user may also have the opportunity to study the costs of the poll required with the number of sample cases determined, and compare it to the available budget in each case.

There are two outputs:

1. A normal distribution simulating the expected behaviour of the sample size determined, showing the standar deviations that apply for each set of inputs.
2. A x-y plot showing the costs associated with the number of cases to be applied and the cost per case accompanied by two lines showing the required sample size and total budget available, to understand the economical feasibility of the proposed sample size given the requirements of the user.

             
###How to use this app:"),

1. Choose values for the margin of error (min = 0.5%, max = 10.0%), for the confidence level (just 3 options, 90%, 95% and 99%), and the size of the Universe (min = 10000, max = 100000).
2. Choose values for the cost of each interview in the poll (from 10 to 100 USD) and the complete budget (from 500 to 1000000 USD).
3. Review the results in the two plots provided.
4. Determine the gaps from the ideal situation for the user.
5. Adjust the inputs and retry until satisfied with the result.
             
             
###Github Repository:

https://github.com/rflsierra/DevelopingDataProducts-PeerAssessment