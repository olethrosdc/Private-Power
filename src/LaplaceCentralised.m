## -*- Mode: octave -*-
##

## Just a quick test of the Laplace mechamism

printf("Starting Laplace test\n");


## Assume that each column is the demand by a single user
function p = LinearPrice(baseline, demand)
  p = baseline + mean(demand, 2);
end

## Add Laplace noise to hide the data of a single individual at each
## time step. This makes each price a differentially private signal
## for each individual's actual demand.
function p = LaplaceLinearIndividual(baseline, demand, epsilon)
  n_steps = rows(baseline);
  n_users = columns(demand);
  p = LinearPrice(baseline, demand);
  sensitivity = 1 / n_users; ## for the linear case
  p += sensitivity * laplace_rnd(n_steps, 1) / epsilon;
  p (p<0) = 0; # prevent negative prices
end

## price is a Tx1 price vector, demand is a TxN demand matrix
function cost = Cost(price, demand)
  cost = price' * demand;
end

n_users = 100;
n_steps = 10000;

baseline = ones(n_steps, 1); ## fixed costs
demand = rand(n_steps, n_users); ## user demand


epsilon = 0.1;
p_linear = LinearPrice(baseline, demand);
cost_linear = Cost(p_linear, demand);
for i=1:1000
  epsilon(i) = i / 1000;
  p_linear_epsilon = LaplaceLinearIndividual(baseline, demand, epsilon(i));
  cost_linear_epsilon = Cost(p_linear_epsilon, demand);
  diff(i) = mean(cost_linear_epsilon - cost_linear);
end

semilogx(epsilon, diff);
xlabel("epsilon");
ylabel("average cost increase");
print("average_cost_increase_linear.pdf");