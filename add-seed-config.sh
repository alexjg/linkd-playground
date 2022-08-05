SEED_PEER_ID=`LNK_HOME=/tmp/seed-home ./lnk.sh profile peer`
PROFILE_ID_1=`cat /tmp/link-local-1/active_profile`
PROFILE_ID_2=`cat /tmp/link-local-2/active_profile`

echo $SEED_PEER_ID@127.0.0.1:8799 | tee /tmp/link-local-1/$PROFILE_ID_1/seeds /tmp/link-local-2/$PROFILE_ID_2/seeds
