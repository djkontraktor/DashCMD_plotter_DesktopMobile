%% DashCmd .CSV file reader v0.1 (Desktop Edition)
% Written by William Christian, 2019.
% Do not copy or make derivatives of
% this work without permission.


function DashCmdReader_Desktop

clear, clc
clf

GUI_Window = figure(1);

title('DashCmd Reader for Desktop')
grid off
axis off
global programRun
global Frame_Number_1
global Frame_Time_2
global Frame_Time_ms_3
global Frame_Time_s_3
global Delta_Frame_Time_ms_4
global Forward_Acceleration_gs_6
global Lateral_Acceleration_gs_8
global Vehicle_Roll_10
global Vehicle_Pitch_12
global Engine_Coolant_Temp_f_32
global Short_Term_Fuel_Trim_Bank_1_percent_35
global Long_Term_Fuel_Trim_Bank_1_percent_37
global Engine_RPM_39
global Vehicle_Speed_Sensor_mph_41
global Intake_Air_Temp_f_44
global Air_Flow_Rate_from_MAF_lb_per_min_47
global O2_Sensor_Voltage_Bank_1_Sensor_2_V_50
global O2_Sensor_Wideband_Bank_1_Sensor_1_Equivalence_Ratio_lambda_52
global Barometric_Pressure_inHg_54
global Instantaneous_Fuel_Consumption_mpg_126
global Calculated_Engine_Power_hp_179
global Calculated_Engine_Torque_lb_ft_195
global plot_query
global Plot_Selection
global Plot_Choice_Number
Plot_Choice_Number = [6, 8, 10, 12, 32, 35, 37, 39, 41,...
    44, 47, 50, 52, 54, 126, 179, 195, 195.5];
Plot_Selection = 1;
plot_query = 6;
programRun = 0;

Load_Button = uicontrol('Style', 'pushbutton',...
    'Position', [100,350,120,25], ...
    'String', 'Load Logfile (.csv)',...
    'Callback', @Load_Button_cb);

Plot_Button = uicontrol('Style', 'pushbutton',...
    'Position', [100,10,120,25], ...
    'String', 'Plot Data',...
    'Callback', @Plot_Button_cb);

Plot_Selection_Dropdown = uicontrol(GUI_Window, 'Style', 'popupmenu');

Plot_Selection_Dropdown.Position = [100,300,400,25];
Plot_Selection_Dropdown.String = {'Forward Acceleration (in g"s)',...
    'Lateral Acceleration (in g"s)',...
    'Vehicle Roll',...
    'Vehicle Pitch',...
    'Engine Coolant Temp. (deg F)',...
    'Fuel Trims (short & long term)',...
    'Vehicle Pitch',...
    'Engine RPM'...
    'Vehicle Speed Sensor (mph)'...
    'Intake Air Temp. (deg F)'...
    'Air Flow Rate from MAF (lb/min)'...
    'O2 Sensor Voltage (Bank 1, Sensor 2) (V)'...
    'O2 Sensor Wideband (Bank 1, Sensor 1) Equivalence Ratio lambda'...
    'Barometric Pressure (inHg)'...
    'Instantaneous Fuel Consumption (mpg)'...
    'Calculated Engine Power (HP)'...
    'Calculated Engine Torque (lb*ft)'...
    'Dyno Chart (HP & torque vs. RPM)'};

Plot_Selection_Dropdown.Callback = @PSD_cb;

fprintf('Console:\n\n');
fprintf('\tProgram started.\n\n');




if (programRun == 1)

        

end


%% Functions

        
        
function Load_Button_cb(~,~)
      
        [file, path] = uigetfile('*.csv', 'Open Datalog');
        
        fprintf('\tLoading logfile. Please wait...\n\n');
        
        % If the file exists...
        if file

            DATA_MAT = readmatrix(file,...
    'OutputType', 'string');

            fprintf('\tLoad successful.\n\n');

            programRun = 1;
            
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
            
        % End if file exists
        end
        
% End function Load_Button_cb
end


function Plot_Button_cb(~,~)
    
        fprintf('\tPlot generated.\n\n');

        Plot_Window = figure('Name', 'Output', 'NumberTitle', 'off');
        
        if (plot_query == 6)
            plot(Frame_Time_s_3, Forward_Acceleration_gs_6);
            xlabel('Time since datalog start (s)');
            title('Forward Acceleration (in g"s)');
            Plot_Window.Name = 'Forward Acceleration (in g"s)';
        elseif (plot_query == 8)
            plot(Frame_Time_s_3, Lateral_Acceleration_gs_8);
            xlabel('Time since datalog start (s)');
            title('Lateral Acceleration (in g"s)');
            Plot_Window.Name = 'Lateral Acceleration (in g"s)';
        elseif (plot_query == 10)
            plot(Frame_Time_s_3, Vehicle_Roll_10);
            xlabel('Time since datalog start (s)');
            title('Vehicle Roll');
            Plot_Window.Name = 'Vehicle Roll';
        elseif (plot_query == 12)
            plot(Frame_Time_s_3, Vehicle_Pitch_12);
            xlabel('Time since datalog start (s)');
            title('Vehicle Pitch');
            Plot_Window.Name = 'Vehicle Pitch';
        elseif (plot_query == 32)
            plot(Frame_Time_s_3, Engine_Coolant_Temp_f_32);
            xlabel('Time since datalog start (s)');
            title('Engine Coolant Temp. (deg F)');
            Plot_Window.Name = 'Engine Coolant Temp. (deg F)';
        elseif (plot_query == 35)
            plot(Frame_Time_s_3, Short_Term_Fuel_Trim_Bank_1_percent_35);
            xlabel('Time since datalog start (s)');
            title('Short Term Fuel Trim Bank 1 (%)');
            Plot_Window.Name = 'Fuel Trims';
        elseif (plot_query == 37)
            plot(Frame_Time_s_3, Long_Term_Fuel_Trim_Bank_1_percent_37);
            xlabel('Time since datalog start (s)');
            title('Long Term Fuel Trim Bank 1 (%)');
        elseif (plot_query == 39)
            plot(Frame_Time_s_3, Engine_RPM_39);
            xlabel('Time since datalog start (s)');
            title('Engine RPM');
            Plot_Window.Name = 'Engine RPM';
        elseif (plot_query == 41)
            plot(Frame_Time_s_3, Vehicle_Speed_Sensor_mph_41);
            xlabel('Time since datalog start (s)');
            title('Vehicle Speed Sensor (mph)');
            Plot_Window.Name = 'Vehicle Speed Sensor (mph)';
        elseif (plot_query == 44)
            plot(Frame_Time_s_3, Intake_Air_Temp_f_44);
            xlabel('Time since datalog start (s)');
            title('Intake Air Temp. (deg F)');
            Plot_Window.Name = 'Intake Air Temp. (deg F)';
        elseif (plot_query == 47)
            plot(Frame_Time_s_3, Air_Flow_Rate_from_MAF_lb_per_min_47);
            xlabel('Time since datalog start (s)');
            title('Air Flow Rate from MAF (lb/min)');
            Plot_Window.Name = 'Air Flow Rate from MAF (lb/min)';
        elseif (plot_query == 50)
            plot(Frame_Time_s_3, O2_Sensor_Voltage_Bank_1_Sensor_2_V_50);
            xlabel('Time since datalog start (s)');
            title('O2 Sensor Voltage Bank 1 Sensor 2 (V)');
            Plot_Window.Name = 'O2 Sensor Voltage Bank 1 Sensor 2 (V)';
        elseif (plot_query == 52)
            plot(Frame_Time_s_3, O2_Sensor_Wideband_Bank_1_Sensor_1_Equivalence_Ratio_lambda_52);
            xlabel('Time since datalog start (s)');
            title('O2 Sensor Wideband Bank 1 Sensor 1 Equivalence Ratio lambda');
            Plot_Window.Name = 'O2 Sensor Wideband Bank 1 Sensor 1 Equivalence Ratio lambda';
        elseif (plot_query == 54)
            plot(Frame_Time_s_3, Barometric_Pressure_inHg_54);
            xlabel('Time since datalog start (s)');
            title('Barometric Pressure (inHg)');
            Plot_Window.Name = 'Barometric Pressure (inHg)';
        elseif (plot_query == 126)
            plot(Frame_Time_s_3, Instantaneous_Fuel_Consumption_mpg_126);
            xlabel('Time since datalog start (s)');
            title('Instantaneous Fuel Consumption (mpg)');
            Plot_Window.Name = 'Instantaneous Fuel Consumption (mpg)';
        elseif (plot_query == 179)
            plot(Frame_Time_s_3, Calculated_Engine_Power_hp_179);
            xlabel('Time since datalog start (s)');
            title('Calculated Engine Power (hp)');
            Plot_Window.Name = 'Calculated Engine Power (hp)';
        elseif (plot_query == 195)
            plot(Frame_Time_s_3, Calculated_Engine_Torque_lb_ft_195);
            xlabel('Time since datalog start (s)');
            title('Calculated Engine Torque (lb*ft)');
            Plot_Window.Name = 'Calculated Engine Torque (lb*ft)';
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
            Plot_Window.Name = 'Dyno Graph (HP & Torque)';
        end

        hold off
        
% End function Plot_Button_cb
end

function PSD_cb(src, event)
      
        Plot_Selection = Plot_Selection_Dropdown.Value;
        
        plot_query = Plot_Choice_Number(Plot_Selection);
        
        
% End function Load_Button_cb
end



% End main function
end