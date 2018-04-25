for dir in $HOME/*; do
  username=$(basename $dir)
  echo "changing ownership to $username in $dir"
  chown -R $username:$username $dir
done
