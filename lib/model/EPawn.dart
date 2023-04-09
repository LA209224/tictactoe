enum Pawn{
  X('X'),
  O('O');

  final String pawn;

  const Pawn(this.pawn);

  String getString()
  {
    return pawn;
  }
}