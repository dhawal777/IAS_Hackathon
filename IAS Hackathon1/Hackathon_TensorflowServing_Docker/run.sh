echo "Enter Remote Ip"
read ip
echo "Enter Remote UserName"
read uname
echo "Enter Remote Password"
read Rpass

tar -czvf hackathon_1.tar.gz hackathon_1

sshpass -p "$Rpass" scp script.sh "$uname"@"$ip":script.sh
sshpass -p "$Rpass" scp hackathon_1.tar.gz "$uname"@"$ip":hackathon_1.tar.gz