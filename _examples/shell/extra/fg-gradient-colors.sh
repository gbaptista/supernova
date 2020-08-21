source _examples/shell/supernova.sh

### Helpers (Shell)

echo ''
echo 'Name:'
echo 'true-color Heartbeat to Splashing Wave' | SUPERNOVA_COLORS=t   $supernova :gradient 'Heartbeat' 'Splashing Wave'
echo ''
echo '256 colors Heartbeat to Splashing Wave' | SUPERNOVA_COLORS=256 $supernova :gradient 'Heartbeat' 'Splashing Wave'
echo ''
echo '16 colors  Heartbeat to Splashing Wave' | SUPERNOVA_COLORS=16  $supernova :gradient 'Heartbeat' 'Splashing Wave'
echo ''
echo '8 colors   Heartbeat to Splashing Wave' | SUPERNOVA_COLORS=8   $supernova :gradient 'Heartbeat' 'Splashing Wave'
echo ''
echo '0 colors   Heartbeat to Splashing Wave' | SUPERNOVA_COLORS=0   $supernova :gradient 'Heartbeat' 'Splashing Wave'
echo ''

echo ''
echo 'Hex:'
echo 'true-color #AA0000 to #3CE8E8' | SUPERNOVA_COLORS=t   $supernova :gradient '#AA0000' '#3CE8E8'
echo ''
echo '256 colors #AA0000 to #3CE8E8' | SUPERNOVA_COLORS=256 $supernova :gradient '#AA0000' '#3CE8E8'
echo ''
echo '16 colors  #AA0000 to #3CE8E8' | SUPERNOVA_COLORS=16  $supernova :gradient '#AA0000' '#3CE8E8'
echo ''
echo '8 colors   #AA0000 to #3CE8E8' | SUPERNOVA_COLORS=8   $supernova :gradient '#AA0000' '#3CE8E8'
echo ''
echo '0 colors   #AA0000 to #3CE8E8' | SUPERNOVA_COLORS=0   $supernova :gradient '#AA0000' '#3CE8E8'
echo ''
