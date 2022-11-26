setTime({required String time}) {
  if (time == '13') {
    time = '01';
  } else if (time == '14') {
    time = '02';
  } else if (time == '15') {
    time = '03';
  } else if (time == '16') {
    time = '04';
  } else if (time == '17') {
    time = '05';
  } else if (time == '18') {
    time = '06';
  } else if (time == '19') {
    time = '07';
  } else if (time == '20') {
    time = '08';
  } else if (time == '21') {
    time = '09';
  } else if (time == '22') {
    time = '10';
  } else if (time == '23') {
    time = '11';
  } else {
    time = '12';
  }
  return time;
}
