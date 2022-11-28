# GEGA
Modification of Genetic Algorithm based on Extinction Events and migration.
The main objective of the modification was to minimise the number of objective function solutions until the minimum for the function was established. It was assumed that, within each step, a population should be smaller than that recommended in the applicable literature, the number of iterations should be limited, the solution area should be variable, and a great extinction event should take place following several iterations. Calculations were performed for 10 individuals within a population, 10 iterations, two generations each, with a great extinction event happening once every three iterations. The developed algorithm was presented, capable of indicating the minimum number of Eggholder and Rastrigin functions, with a higher probability than the master algorithm (default “ga” in MATLAB) at the same number of objective function solutions.
