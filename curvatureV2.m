
Steering_Wheel_angles = Data.SteeringwheelAngle
ABC=[Data.P1x(1) Data.P1y(1) ; Data.P2x(1) Data.P2y(1) ; Data.P3x(1) Data.P3y(1)]
data_size = size(Data)
data_size_row = data_size(1)
 for i = 1:data_size_row
     ABC(:,:,i)=[Data.P1x(i) Data.P1y(i) ; Data.P2x(i) Data.P2y(i) ; Data.P3x(i) Data.P3y(i)]
 end

[R,xcyc] = fit_circle_through_3_points(ABC)
%%R = L / tan(a) 
%R = Radius
%L = distance between front axle 2.64m GOlf
L = 2.64
%a = Wheel angle rad
%tan(a)=L/R
a = atan(L./R)
    for i = 1:data_size_row
        if Steering_Wheel_angles(i) < 0
           a(i) = -a(i); 
        end
    end
plot(Steering_Wheel_angles,a)
title('Map Plot')
xlabel('Steering Wheel angle')
ylabel('Wheel Rad')
map = [Steering_Wheel_angles a']
T = array2table(map,...
    'VariableNames',{'Steering_Wheel_angles' 'Wheel_Rad'})
  writetable(T,'Map.xls');