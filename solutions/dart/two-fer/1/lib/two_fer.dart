String twoFer([String nameOfPerson = '']) {
  if (nameOfPerson == '') {
    return 'One for you, one for me.';
  }
  return 'One for $nameOfPerson, one for me.';
}
