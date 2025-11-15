%Tony Ortiz Rangel
%Heating ODE solution using ode45
Tb = 170;
T0 = 70;
[t,T] = ode45(@(t,T) (Tb - T)/10,[0 40],T0);
%Closed form T(t)
T10 = interp1(t,T,10);
T20 = interp1(t,T,20);
T40 = interp1(t,T,40);
fprintf("Temperatures at 10, 20, 40 seconds: %.4f  %.4f  %.4f\n",T10,T20,T40);
idx = find(T>=160,1,'first');
t160 = interp1(T(idx-1:idx),t(idx-1:idx),160);
fprintf("Time to reach 160 F: %.1f seconds\n",t160);
plot(t,T,'LineWidth',2)
grid on
ylim([0 180])
xlabel('Time (s)')
ylabel('Temperature (F)')
title('Temperature vs Time')
