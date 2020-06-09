% file 'predator-prey_model.m'
set(figure,'Name','Lotka-Volterra models of Predator-Prey Relationships','NumberTitle','off')

function dx=f(x,t)
	dx(1) = -0.2*x(1) + 0.05*x(1)*x(2);
	dx(2) = 0.5*x(2) - 0.02*x(1)*x(2);
endfunction


x0=[5;10]; 
t = [0: 0.1: 400];
y = lsode("f", x0, t);
y1 = y(:, 1);
y2 = y(:, 2);

sPoint = [ 0.5/0.02; 0.2/0.05 ]

subplot(2,2, 1:2);
  	hold on
  	plot(sPoint(1),sPoint(2), 'o')
	plot(y1, y2, "linewidth", 1 , 'm');
  	legend("Stationary point", "LotkaVolterra equations")
	xlabel("Predators");
	ylabel("Preys");
	title("Predator-Prey model");
subplot (2, 2, 3);
	plot(t, y1, "linewidth", 1 , 'g');
	xlabel("Time");
	ylabel("Number of predators");
	title("Number of changes predator populations");
subplot (2, 2, 4);
	plot(t, y2, "linewidth", 1 , 'c');
	xlabel("Time");
	ylabel("Number of preys");
	title("Number of changes prey populations");
