background        no
out_to_console 	  yes
out_to_x	  no
update_interval	  2
total_run_times	  0
short_units	  yes
pad_percents	  3
max_text_width 0
if_up_strictness address
override_utf8_locale	no
use_xft yes


TEXT
[
  ${if_mpd_playing}{ "full_text" : "♬ ${mpd_artist} - ${mpd_title}", "color" : "\#a6a6a6"},${endif}  
  
  {"full_text": " ${execpi 60 ~/bin/gmail.sh}", "color":"\#a6a6a6"},\
 
  ${if_up enp4s0}{ "full_text" : " ${addr enp4s0} \u2193${downspeedf enp5s0}k \u2191${upspeedf enp4s0}k", "color" : "\#a6a6a6"},
  ${else}
  ${if_up wlp3s0}{ "full_text" : " \u2193${downspeedf wlp3s0}k \u2191${upspeedf wlp3s0}k", "color" : "\#a6a6a6"},  
  ${else}
  {"full_text": "no connection","color":"\#E59847"},\
  ${endif}
  
  {"full_text":" ${execpi 60 pactl list sinks | grep "Volume: front-left" | cut -d " " -f6 }", "color":"\#a6a6a6"},\
  
  #${if_existing /sys/class/power_supply/AC0/online 0}
  #{"full_text": "","color":"\"859900","separator":false,"separator_block_width":6},\
  #{"full_text": "${if_match ${battery_percent}<20}   ${battery_percent}%","color":"\#dc322f"},\
  #{"full_text":"${else}"},\
  #{"full_text":"${if_match ${battery_percent}<50}   ${battery_percent}%","color":"\#b58900"},\
  #{"full_text":"${else}"},\
  #{"full_text":"${if_match ${battery_percent}==100}   ${battery_percent}%","color":"\#a6a6a6"},\
  #{"full_text":"${else}"},\
  #{"full_text":"${if_match ${battery_percent}>80}   ${battery_percent}%","color":"\#a6a6a6"},\
  #{"full_text":"${else}"},\
  #{"full_text":"${if_match ${battery_percent}>=50}   ${battery_percent}%","color":"\#a6a6a6"},\
  #{"full_text":"${else}"},\
  #{"full_text":"${endif}${endif}${endif}${endif}${endif}"},\
  #${else}
  #{"full_text": " ? ${battery_percent}% ","color":"\#859900"},\
  #${endif}
  
  ${if_existing /sys/class/power_supply/AC0/online 0}
  {"full_text": "","color":"\"859900","separator":false,"separator_block_width":6},\
  {"full_text": "${if_match ${battery_percent BAT1}<20}   ${battery_percent BAT1}%","color":"\#dc322f"},\
  {"full_text":"${else}"},\
  {"full_text":"${if_match ${battery_percent BAT1}<50}   ${battery_percent BAT1}%","color":"\#b58900"},\
  {"full_text":"${else}"},\
  {"full_text":"${if_match ${battery_percent BAT1}==100}   ${battery_percent BAT1}%","color":"\#a6a6a6"},\
  {"full_text":"${else}"},\
  {"full_text":"${if_match ${battery_percent BAT1}>80}   ${battery_percent BAT1}%","color":"\#a6a6a6"},\
  {"full_text":"${else}"},\
  {"full_text":"${if_match ${battery_percent BAT1}>=50}   ${battery_percent BAT1}%","color":"\#a6a6a6"},\
  {"full_text":"${else}"},\
  {"full_text":"${endif}${endif}${endif}${endif}${endif}"},\
  #${else}
  #{"full_text": " ? ${battery_percent BAT1}% ","color":"\#859900"},\
  #${endif}   

  {"full_text":" ${time %a, %b %d}", "color":"\#a6a6a6"},\
    
  {"full_text":" ${time %H:%M}", "color":"\#a6a6a6"}\

],
