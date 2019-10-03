%% DashCmd .CSV file reader v0.1 (iPhone Edition)
% Written by William Christian, 2019.
% Do not copy or make derivatives of
% this work without permission.

clear
hold off
clc

fprintf('Program started.\n\n');
fprintf('Valid Logfiles:\n\n');

dinfo = dir;

filenames = char(dinfo.name);

file_str = " ";

indices_str = [];



for r = 1:size(filenames, 1)
    
    for c = 1:size(filenames, 2)
    
        charblock = (filenames(r, c));
    
    end
    
    if isequal(charblock, 'v')
        
        indices_str = [indices_str, r];
        
    end
    
    file_str = file_str + charblock;
    
end




fprintf('0 --- Quit\n')

for i = 1:length(indices_str)
    
    fprintf('%0d --- ', i)
    disp(filenames(indices_str(i), :))
    
end


fprintf('\n')

fprintf('Enter the number of the logfile you wish to view:\n');

filenumber = input(' ');


if (filenumber == 0)
    
    clear
    clc
    error('Program terminated.')
    
end

filename = filenames(indices_str(filenumber), :);

DATA_MAT = readmatrix(filename,...
    'OutputType', 'string');



fprintf('Loading the logfile...\n\n');
disp(filename)

Frame_Number_1 = str2double(DATA_MAT(:, 1));

Frame_Time_2 = DATA_MAT(:, 2);

Frame_Time_ms_3 = str2double(DATA_MAT(:, 3));
Frame_Time_s_3 = Frame_Time_ms_3./1000;

Delta_Frame_Time_ms_4 = str2double(DATA_MAT(:, 4));

Forward_Acceleration_gs_6 = str2double(DATA_MAT(:, 6));

Lateral_Acceleration_gs_8 = str2double(DATA_MAT(:, 8));

Vehicle_Roll_10 = str2double(DATA_MAT(:, 10));

Vehicle_Pitch_12 = str2double(DATA_MAT(:, 12));

Engine_Coolant_Temp_f_32 = str2double(DATA_MAT(:, 32));

Short_Term_Fuel_Trim_Bank_1_percent_35 = str2double(DATA_MAT(:, 35));

Long_Term_Fuel_Trim_Bank_1_percent_37 = str2double(DATA_MAT(:, 37));

Engine_RPM_39 = str2double(DATA_MAT(:, 39));

Vehicle_Speed_Sensor_mph_41 = str2double(DATA_MAT(:, 41));

Intake_Air_Temp_f_44 = str2double(DATA_MAT(:, 44));

Air_Flow_Rate_from_MAF_lb_per_min_47 = str2double(DATA_MAT(:, 47));

O2_Sensor_Voltage_Bank_1_Sensor_2_V_50 = str2double(DATA_MAT(:, 50));

O2_Sensor_Wideband_Bank_1_Sensor_1_Equivalence_Ratio_lambda_52 = ...
    str2double(DATA_MAT(:, 52));

Barometric_Pressure_inHg_54 = str2double(DATA_MAT(:, 54));

Instantaneous_Fuel_Consumption_mpg_126 = str2double(DATA_MAT(:, 126));

Calculated_Engine_Power_hp_179 = str2double(DATA_MAT(:, 179));

Calculated_Engine_Torque_lb_ft_195 = str2double(DATA_MAT(:, 195));

fprintf('Load successful.\n');

programRun = 1;

while (programRun == 1)
    
fprintf('List of Data Types to Plot:\n');
fprintf('0 ---- Quit\n');
fprintf('6 ---- Forward Acceleration (in gs)\n');
fprintf('8 ---- Lateral Acceleration (in gs)\n');
fprintf('10 --- Vehicle Roll\n');
fprintf('12 --- Vehicle Pitch\n');
fprintf('32 --- Engine Coolant Temp. (F)\n');
fprintf('35 --- Short Term Fuel Trim Bank 1 (pct)\n');
fprintf('37 --- Long Term Fuel Trim Bank 1 (pct)\n');
fprintf('39 --- Engine RPM\n');
fprintf('41 --- Vehicle Speed Sensor (mph)\n');
fprintf('44 --- Intake Air Temp. (F)\n');
fprintf('47 --- Air Flow Rate from MAF (lb/min)\n');
fprintf('50 --- O2 Sensor Voltage Bank 1 Sensor 2 (V)\n');
fprintf('52 --- O2 Sensor Wideband Bank 1 Sensor 1 Equivalence Ratio lambda\n');
fprintf('54 --- Barometric Pressure (inHg)\n');
fprintf('126 -- Instantaneous Fuel Consumption (mpg)\n');
fprintf('179 -- Calculated Engine Power (hp)\n');
fprintf('195 -- Calculated Engine Torque (lbft)\n');
fprintf('195.5 - Dyno Graph (HP, Torque, & RPM)\n\n');
    

plot_query = input('Enter a number to plot it vs. time: ');

if (plot_query == 0)
    
    clear
    clc
    error('Program terminated.')

elseif (plot_query == 6)
    plot(Frame_Time_s_3, Forward_Acceleration_gs_6);
    xlabel('Time since datalog start (s)');
    title('Forward Acceleration (in g"s)');
elseif (plot_query == 8)
    plot(Frame_Time_s_3, Lateral_Acceleration_gs_8);
    xlabel('Time since datalog start (s)');
    title('Lateral Acceleration (in g"s)');
elseif (plot_query == 10)
    plot(Frame_Time_s_3, Vehicle_Roll_10);
    xlabel('Time since datalog start (s)');
    title('Vehicle Roll');
elseif (plot_query == 12)
    plot(Frame_Time_s_3, Vehicle_Pitch_12);
    xlabel('Time since datalog start (s)');
    title('Vehicle Pitch');
elseif (plot_query == 32)
    plot(Frame_Time_s_3, Engine_Coolant_Temp_f_32);
    xlabel('Time since datalog start (s)');
    title('Engine Coolant Temp. (^oF)');
elseif (plot_query == 35)
    plot(Frame_Time_s_3, Short_Term_Fuel_Trim_Bank_1_percent_35);
    xlabel('Time since datalog start (s)');
    title('Short Term Fuel Trim Bank 1 (%)');
elseif (plot_query == 37)
    plot(Frame_Time_s_3, Long_Term_Fuel_Trim_Bank_1_percent_37);
    xlabel('Time since datalog start (s)');
    title('Long Term Fuel Trim Bank 1 (%)');
elseif (plot_query == 39)
    plot(Frame_Time_s_3, Engine_RPM_39);
    xlabel('Time since datalog start (s)');
    title('Engine RPM');
elseif (plot_query == 41)
    plot(Frame_Time_s_3, Vehicle_Speed_Sensor_mph_41);
    xlabel('Time since datalog start (s)');
    title('Vehicle Speed Sensor (mph)');
elseif (plot_query == 44)
    plot(Frame_Time_s_3, Intake_Air_Temp_f_44);
    xlabel('Time since datalog start (s)');
    title('Intake Air Temp. (^oF)');
elseif (plot_query == 47)
    plot(Frame_Time_s_3, Air_Flow_Rate_from_MAF_lb_per_min_47);
    xlabel('Time since datalog start (s)');
    title('Air Flow Rate from MAF (lb/min)');
elseif (plot_query == 50)
    plot(Frame_Time_s_3, O2_Sensor_Voltage_Bank_1_Sensor_2_V_50);
    xlabel('Time since datalog start (s)');
    title('O2 Sensor Voltage Bank 1 Sensor 2 (V)');
elseif (plot_query == 52)
    plot(Frame_Time_s_3, O2_Sensor_Wideband_Bank_1_Sensor_1_Equivalence_Ratio_lambda_52);
    xlabel('Time since datalog start (s)');
    title('O2 Sensor Wideband Bank 1 Sensor 1 Equivalence Ratio lambda');
elseif (plot_query == 54)
    plot(Frame_Time_s_3, Barometric_Pressure_inHg_54);
    xlabel('Time since datalog start (s)');
    title('Barometric Pressure (inHg)');
elseif (plot_query == 126)
    plot(Frame_Time_s_3, Instantaneous_Fuel_Consumption_mpg_126);
    xlabel('Time since datalog start (s)');
    title('Instantaneous Fuel Consumption (mpg)');
elseif (plot_query == 179)
    plot(Frame_Time_s_3, Calculated_Engine_Power_hp_179);
    xlabel('Time since datalog start (s)');
    title('Calculated Engine Power (hp)');
elseif (plot_query == 195)
    plot(Frame_Time_s_3, Calculated_Engine_Torque_lb_ft_195);
    xlabel('Time since datalog start (s)');
    title('Calculated Engine Torque (lb*ft)');
elseif (plot_query == 195.5)
    
    torque_curve = sortrows([Engine_RPM_39, Calculated_Engine_Torque_lb_ft_195], 1);
    
    torque_curve = torque_curve(all(~isnan(torque_curve),2),:);
    
    
    for t = 1:size(torque_curve, 1)
        
        currRPM = torque_curve(t,1);
        
        currTQ = torque_curve(t,2);
        
        if t == size(torque_curve, 1)
            
           nextRPM = 0;
           nextTQ = 0;
            
        else
            
           nextRPM = torque_curve(t+1,1);
           nextTQ = torque_curve(t+1,2);
           
        end
        
        if currRPM == nextRPM
            
            peakTQ = max(currTQ, nextTQ);
            
        else
            
            peakTQ = max(currTQ, peakTQ);
            
            tq_crv(t, 2) = peakTQ;
            tq_crv(t, 1) = currRPM;
            
        end
        
    
    end
    
    tq_crv = tq_crv(any(tq_crv,2),:);
        
    
    scatter(Engine_RPM_39, Calculated_Engine_Power_hp_179, 'b', '.');
    hold on
    scatter(Engine_RPM_39, Calculated_Engine_Torque_lb_ft_195, 'r', '.');
    %plot(tq_crv(:,1), tq_crv(:,2), 'g');
    xlabel('Engine RPM');
    legend('HP','Torque (lb*ft)', 'location', 'northwest');
    title('Dyno Graph (HP & Torque)');
end

hold off

end