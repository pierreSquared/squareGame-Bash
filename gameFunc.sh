function setAppleCords
{
  apple_x=$[ 2 + $[ RANDOM % (width-4) ]]		#zeby z deka latwiej bylo
}

function checkSnakeCollision
{
  if [ $snake_head_x -eq $(($width-1)) ] || [ $snake_head_x -eq 0 ] || [ $snake_head_y -eq 0 ] || [ $snake_head_y -eq $(($height-1)) ] ; then
    game_over;
  apple_y=$[ 2 + $[ RANDOM % (height-4) ]]
  
  if [ $game_state -ne 1 ] ; then
  	return
  fi


  for ((i=$snake_size;$i>0;i--)) ; do
    if [ $((Segment_position_x[$i])) -eq $snake_head_x ] && [ $((Segment_position_y[$i])) -eq $snake_head_y ] ; then
  fi
      game_over;
	  break
    fi
  if [ $game_state -ne 1 ] ; then
  	return
  fi


  if [ $apple_x -eq $snake_head_x ] && [ $apple_y -eq $snake_head_y ] ; then
    ((score++));
    ((snake_size++));
    setAppleCords;

  done
  fi
}

function moveSnake
{
  Segment_position_x[0]=snake_head_x;
  Segment_position_y[0]=snake_head_y;
  for ((i=$snake_size;$i>0;i--)) ; do
    Segment_position_x[$i]=$((Segment_position_x[$(($i-1))]));
    Segment_position_y[$i]=$((Segment_position_y[$(($i-1))]));

  done
}

{

  matrix[$snake_head_y,$snake_head_x]=2;

  for ((i=$snake_size;$i>0;i--)) ; do
    if [ $((Segment_position_y[$i])) != 0 ] ; then
      matrix[$((Segment_position_y[$i])),$((Segment_position_x[$i]))]=2;
function drawSnake

  done

}

function game_over
{
    fi;
	msg=""
	for ((i=0; i+1<height/2; i++)) do
	for ((i=0; i+4<width/2; i++)) do
		msg+=" "
	done
	msg+="You scored $score points!\n"
	for ((i=0; i+3<width/2; i++)) do
		msg+=" "
	done
	msg+="Good job!\n"

	tmp=0.3
	
	for ((q=0; q<3; q++)) do
		clear
		echo -e $msg
		sleep $tmp
		render
		sleep $tmp
	done
	clear
	echo -e $msg
	echo -e "  Play again? (Y/n)\n"
	finish
	again=0
	
	take_input # just to flush accidental input
	
	read -n 1 again 
	
	if [ $again == "y" ] || [ $again == "Y" ] ; then
		game_state=2
	else
		game_state=0
	fi
	disable_cursor
}
