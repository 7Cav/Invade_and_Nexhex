#include "..\script_component.hpp";
/*
 * Author: CPL.Brostrom.A
 * This function sets a player radio channels based on squad name. If -1 no radio will be set. 
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * ["bob"] call cScripts_fnc_setRadioChannel
 *
 * Public: No
 */

params [["_player", objNull, [objNull]]];

if !(EGVAR(patches,usesACRE)) exitWith {};
if !(EGVAR(Settings,enableACRE)) exitWith {};
if !(isPlayer player) exitWith {};

_player setVariable [QEGVAR(Player,RadioChannel), []];
private _playerRadios = [_player] call acre_api_fnc_getCurrentRadioList;
{
    if !(_x == "") then {
        private _radio = [_x] call acre_api_fnc_getBaseRadio;
        private _channel = [[_player] call FUNC(getSquadName), _radio] call FUNC(getRadioChannel);

        [_x, _channel] call acre_api_fnc_setRadioChannel;
        #ifdef DEBUG_MODE
            [format["%1 radio (%2) have its channel set to %3", _player, _x, _channel], "Radio"] call FUNC(info);
        #endif

        // Store radio channels in variable.
        private _radioAndChannel = _player getVariable [QEGVAR(Player,RadioChannel), []];
        _radioAndChannel pushBack [[_x] call acre_api_fnc_getBaseRadio, _channel];
        _player setVariable [QEGVAR(Player,RadioChannel), _radioAndChannel];
    } else {
        [format["Empty radio is trying to get it's channel applied for %1", _player], "Radio"] call FUNC(warning);
    };
} forEach _playerRadios;