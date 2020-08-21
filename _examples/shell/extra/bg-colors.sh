source _examples/shell/supernova.sh

### Helpers (Shell)

echo ''
echo 'Name:'
echo 'true-color Heartbeat' | SUPERNOVA_COLORS=t   $supernova :bg 'Heartbeat'
echo '256 colors Heartbeat' | SUPERNOVA_COLORS=256 $supernova :bg 'Heartbeat'
echo '16 colors  Heartbeat' | SUPERNOVA_COLORS=16  $supernova :bg 'Heartbeat'
echo '8 colors   Heartbeat' | SUPERNOVA_COLORS=8   $supernova :bg 'Heartbeat'
echo '0 colors   Heartbeat' | SUPERNOVA_COLORS=0   $supernova :bg 'Heartbeat'

echo ''
echo 'Hex:'
echo 'true-color #AA0000' | SUPERNOVA_COLORS=t   $supernova :bg '#AA0000'
echo '256 colors #AA0000' | SUPERNOVA_COLORS=256 $supernova :bg '#AA0000'
echo '16 colors  #AA0000' | SUPERNOVA_COLORS=16  $supernova :bg '#AA0000'
echo '8 colors   #AA0000' | SUPERNOVA_COLORS=8   $supernova :bg '#AA0000'
echo '0 colors   #AA0000' | SUPERNOVA_COLORS=0   $supernova :bg '#AA0000'

echo ''
echo 'RGB:'
echo 'true-color 170 0 0' | SUPERNOVA_COLORS=t   $supernova :bg 170 0 0
echo '256 colors 170 0 0' | SUPERNOVA_COLORS=256 $supernova :bg 170 0 0
echo '16 colors  170 0 0' | SUPERNOVA_COLORS=16  $supernova :bg 170 0 0
echo '8 colors   170 0 0' | SUPERNOVA_COLORS=8   $supernova :bg 170 0 0
echo '0 colors   170 0 0' | SUPERNOVA_COLORS=0   $supernova :bg 170 0 0
echo ''

echo '-------------------------------------'


echo ''
echo 'Name:'
echo 'true-color Splashing Wave' | SUPERNOVA_COLORS=t   $supernova :bg 'Splashing Wave'
echo '256 colors Splashing Wave' | SUPERNOVA_COLORS=256 $supernova :bg 'Splashing Wave'
echo '16 colors  Splashing Wave' | SUPERNOVA_COLORS=16  $supernova :bg 'Splashing Wave'
echo '8 colors   Splashing Wave' | SUPERNOVA_COLORS=8   $supernova :bg 'Splashing Wave'
echo '0 colors   Splashing Wave' | SUPERNOVA_COLORS=0   $supernova :bg 'Splashing Wave'

echo ''
echo 'Hex:'
echo 'true-color #3CE8E8' | SUPERNOVA_COLORS=t   $supernova :bg '#3CE8E8'
echo '256 colors #3CE8E8' | SUPERNOVA_COLORS=256 $supernova :bg '#3CE8E8'
echo '16 colors  #3CE8E8' | SUPERNOVA_COLORS=16  $supernova :bg '#3CE8E8'
echo '8 colors   #3CE8E8' | SUPERNOVA_COLORS=8   $supernova :bg '#3CE8E8'
echo '0 colors   #3CE8E8' | SUPERNOVA_COLORS=0   $supernova :bg '#3CE8E8'

echo ''
echo 'RGB:'
echo 'true-color 60 232 232' | SUPERNOVA_COLORS=t   $supernova :bg 60 232 232
echo '256 colors 60 232 232' | SUPERNOVA_COLORS=256 $supernova :bg 60 232 232
echo '16 colors  60 232 232' | SUPERNOVA_COLORS=16  $supernova :bg 60 232 232
echo '8 colors   60 232 232' | SUPERNOVA_COLORS=8   $supernova :bg 60 232 232
echo '0 colors   60 232 232' | SUPERNOVA_COLORS=0   $supernova :bg 60 232 232
echo ''
