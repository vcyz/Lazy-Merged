#! /bin/bash
#Ahhh-This-Lol-Script-V2

echo " "
echo "Update Platform Sourced Kernel"

#Connect_to_account
git config --global user.name "Calliope-K"
git config --global user.email "firsname76@gmail.com"

#Cloning_Source
git clone https://github.com/Calliope-K/Tea-WIP -b WIP-4.19
cd Tea-WIP

#Execute_Script_Merged_qcacld
git remote add qcacld https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/wlan/qcacld-3.0
git fetch qcacld LA.UM.7.2.r1-09600-sdm660.0
git merge -X subtree=drivers/staging/qcacld-3.0 FETCH_HEAD
git commit -m Update:Qcacld-3.0 --signoff

#Execute_Script_Merged_Fw_Api
git remote add fw-api https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/wlan/fw-api
git fetch fw-api LA.UM.7.2.r1-09600-sdm660.0
git merge -X subtree=drivers/staging/fw-api FETCH_HEAD
git commit -m Update:Fw-Api --signoff

#Execute_Script_Merged_HostWifi
git remote add qca-wifi-host-cmn https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/wlan/qca-wifi-host-cmn
git fetch qca-wifi-host-cmn LA.UM.7.2.r1-09600-sdm660.0
git merge -X subtree=drivers/staging/qca-wifi-host-cmn FETCH_HEAD
git commit -m Update:Qca-Wifi-Host --signoff

#push_commits
git push https://$GITHUB_TOKEN@github.com/Calliope-K/Tea-WIP.git

echo " "
echo "Update Finished"