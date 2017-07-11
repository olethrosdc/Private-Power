## -*- Mode: octave -*-

M.elasticity = 0.1;
M.ask = 10;
M.cost = 0.5;
M.baseline = 0.1;

function x = Demand(price, M)
  x = M.ask - M.elasticity .* price;
end

function u = Util(p, M)
  u = (p - M.cost) .* (Demand(p, M) + M.baseline);
end

function p_opt = OptimalPrice(M)
  p_opt = 0.5 * ((M.ask + M.baseline) / M.elasticity + M.cost);
end


function Results = ExponentialResults(Epsilons, M)
  k = 1;
  p = OptimalPrice(M) * [0:100]/50;
  u = Util(p, M);
  plot(p, u);
  xlabel("$\\price$")
  ylabel("$\\util$")
  matlab2tikz("parseStrings", false, "width", "0.3\\textwidth", "price-utility.tikz");
  
  Delta = 1 ./ M.elasticity - M.cost;
  for epsilon=Epsilons;
	Pr = exp(epsilon .* u  / Delta);
	Pr /= sum(Pr);
	Eu(k) = Pr* u';
	Ep(k) = Pr* p';
	k++;
  end
  Results.Eu = Eu;
  Results.Ep = Ep;
end

function Results = LaplaceResults(Epsilons, M, n_iter)
  k = 1;
  noise = laplace_rnd(n_iter, 1);
  for epsilon=Epsilons;
	Eu(k) = 0;
	Ep(k) = 0;
	for i=1:n_iter
	  ask_i = M.ask + noise(i) / epsilon;
	  price_i =  0.5 * ((ask_i + M.baseline) / M.elasticity + M.cost);
	  Ep(k) += price_i;
	  Eu(k) += Util(price_i, M);
	end
	Eu(k) /= n_iter;
	Ep(k) /= n_iter;
	k++;
  end
  Results.Eu = Eu;
  Results.Ep = Ep;
end

Epsilons = [0:10]/10;

exp_results = ExponentialResults(Epsilons, M);
lap_results = LaplaceResults(Epsilons, M, 1000);


%%% plot utility %%%
plot(Epsilons, exp_results.Eu, ';Exponential;', Epsilons, lap_results.Eu, ';Laplace;')
xlabel("$\\epsilon$");
ylabel("$\\util$");
legend("location", "southeast")
matlab2tikz("parseStrings", false, "width", "0.3\\textwidth", "epsilon-utility.tikz");


%%% plot price %%%
plot(Epsilons, exp_results.Ep, ';Exponential;', Epsilons, lap_results.Ep, ';Laplace ;')
xlabel("$\\epsilon$");
ylabel("$\\price$");
legend("location", "southeast")
matlab2tikz("parseStrings", false, "width", "0.3\\textwidth", "epsilon-price.tikz");
