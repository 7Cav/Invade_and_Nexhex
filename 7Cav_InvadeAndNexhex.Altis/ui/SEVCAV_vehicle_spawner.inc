class SEVCAV_vehicle_spawner {
    idd = 5204;
    movingEnable = false;
    controlsBackground[] = {};

    controls[] = {"V_Border_Background","V_Active_BG", "V_Title_Text", "V_spawn_btn", "V_cancel_btn","V_vehtyp_selector","V_vehtyp_selector_text","V_vehicle_selector_text","V_vehicle_selector","V_position_selector_text","V_position_selector","V_cav_logo","V_ground_count_text","V_ground_count_var","V_rotary_count_text","V_rotary_count_var","V_fixed_count_var","V_fixed_count_text"};

    objects[] = {};

    class V_Border_Background: vRscText
    {
        idc = 1000;
        x = 0.29375 * safezoneW + safezoneX;
        y = 0.225 * safezoneH + safezoneY;
        w = 0.4125 * safezoneW;
        h = 0.484 * safezoneH;
        colorBackground[] = {1,0.95,0,1};
        colorActive[] = {1,0.95,0,1};
    };
    class V_Active_BG: vRscText
    {
        idc = 1002;
        x = 0.298904 * safezoneW + safezoneX;
        y = 0.236 * safezoneH + safezoneY;
        w = 0.402187 * safezoneW;
        h = 0.462 * safezoneH;
        colorBackground[] = {0.2,0.2,0.2,1};
        colorActive[] = {0.2,0.2,0.2,1};
    };
    class V_Title_Text: vRscText
    {
        idc = 1003;
        text = "7th Cav Vehicle System"; //--- ToDo: Localize;
        x = 0.453594 * safezoneW + safezoneX;
        y = 0.236 * safezoneH + safezoneY;
        w = 0.0876563 * safezoneW;
        h = 0.044 * safezoneH;
        colorText[] = {1,0.95,0,1};
    };
    class V_spawn_btn: vRscButton
    {
        idc = 1600;
        text = "Spawn Vehicle"; //--- ToDo: Localize;
        x = 0.422656 * safezoneW + safezoneX;
        y = 0.654 * safezoneH + safezoneY;
        w = 0.0670312 * safezoneW;
        h = 0.033 * safezoneH;
        colorBackground[] = {0,0,0,1};
        colorActive[] = {0.5,0.5,0.5,1};
    };
    class V_cancel_btn: vRscButton
    {
        idc = 1601;
        text = "Cancel"; //--- ToDo: Localize;
        x = 0.494844 * safezoneW + safezoneX;
        y = 0.654 * safezoneH + safezoneY;
        w = 0.0670312 * safezoneW;
        h = 0.033 * safezoneH;
        colorBackground[] = {0,0,0,1};
        colorActive[] = {0.5,0.5,0.5,1};
    };
    class V_vehtyp_selector: vRscCombo
    {
        idc = 2100;
        x = 0.304062 * safezoneW + safezoneX;
        y = 0.467 * safezoneH + safezoneY;
        w = 0.190781 * safezoneW;
        h = 0.022 * safezoneH;
    };
    class V_vehtyp_selector_text: vRscText
    {
        idc = 1004;
        text = "1. Select Vehicle Base Type"; //--- ToDo: Localize;
        x = 0.304062 * safezoneW + safezoneX;
        y = 0.445 * safezoneH + safezoneY;
        w = 0.221719 * safezoneW;
        h = 0.022 * safezoneH;
    };
    class V_vehicle_selector_text: vRscText
    {
        idc = 1005;
        text = "2. Select Vehicle"; //--- ToDo: Localize;
        x = 0.304062 * safezoneW + safezoneX;
        y = 0.511 * safezoneH + safezoneY;
        w = 0.221719 * safezoneW;
        h = 0.022 * safezoneH;
    };
    class V_vehicle_selector: vRscCombo
    {
        idc = 2101;
        x = 0.304062 * safezoneW + safezoneX;
        y = 0.533 * safezoneH + safezoneY;
        w = 0.190781 * safezoneW;
        h = 0.022 * safezoneH;
    };
    class V_position_selector_text: vRscText
    {
        idc = 1006;
        text = "3. Select Spawn Position"; //--- ToDo: Localize;
        x = 0.304062 * safezoneW + safezoneX;
        y = 0.577 * safezoneH + safezoneY;
        w = 0.221719 * safezoneW;
        h = 0.022 * safezoneH;
    };
    class V_position_selector: vRscCombo
    {
        idc = 2102;
        x = 0.304062 * safezoneW + safezoneX;
        y = 0.599 * safezoneH + safezoneY;
        w = 0.190781 * safezoneW;
        h = 0.022 * safezoneH;
    };
    class V_cav_logo: vRscPicture
    {
        idc = 1200;
        text = "#(argb,8,8,3)color(1,1,1,1)";
        x = 0.4175 * safezoneW + safezoneX;
        y = 0.269 * safezoneH + safezoneY;
        w = 0.165 * safezoneW;
        h = 0.165 * safezoneH;
    };
    class V_ground_count_text: vRscText
    {
        idc = 1007;
        text = "Spawned Ground Vehicles"; //--- ToDo: Localize;
        x = 0.561875 * safezoneW + safezoneX;
        y = 0.445 * safezoneH + safezoneY;
        w = 0.103125 * safezoneW;
        h = 0.022 * safezoneH;
    };
    class V_ground_count_var: vRscText
    {
        idc = 1009;
        text = "0 of 10"; //--- ToDo: Localize;
        x = 0.597969 * safezoneW + safezoneX;
        y = 0.467 * safezoneH + safezoneY;
        w = 0.103125 * safezoneW;
        h = 0.022 * safezoneH;
    };
    class V_rotary_count_text: vRscText
    {
        idc = 1010;
        text = "Spawned Rotary Vehicles"; //--- ToDo: Localize;
        x = 0.561875 * safezoneW + safezoneX;
        y = 0.511 * safezoneH + safezoneY;
        w = 0.103125 * safezoneW;
        h = 0.022 * safezoneH;
    };
    class V_rotary_count_var: vRscText
    {
        idc = 1011;
        text = "0 of 6"; //--- ToDo: Localize;
        x = 0.597969 * safezoneW + safezoneX;
        y = 0.533 * safezoneH + safezoneY;
        w = 0.103125 * safezoneW;
        h = 0.022 * safezoneH;
    };
    class V_fixed_count_var: vRscText
    {
        idc = 1012;
        text = "0 of 4"; //--- ToDo: Localize;
        x = 0.597969 * safezoneW + safezoneX;
        y = 0.599 * safezoneH + safezoneY;
        w = 0.103125 * safezoneW;
        h = 0.022 * safezoneH;
    };
    class V_fixed_count_text: vRscText
    {
        idc = 1013;
        text = "Spawned Fixed Wing Vehicles"; //--- ToDo: Localize;
        x = 0.561875 * safezoneW + safezoneX;
        y = 0.577 * safezoneH + safezoneY;
        w = 0.103125 * safezoneW;
        h = 0.022 * safezoneH;
    };
};