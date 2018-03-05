module Optcarrot
end

class Optcarrot::Pads
  @conf: any
  @cpu: any
  @apu: any
  @pads: Array<Pad>

  def initialize: (any, any, any) -> any
  def reset: () -> any
  def keydown: (Integer, Integer) -> any
  def keyup: (Integer, Integer) -> any
  def poke_4016: (Integer, Integer) -> Integer
  def peek_401x: (Integer) -> Integer
end

class Optcarrot::Pad
  @strobe: _Boolean
  @buttons: Integer
  @stream: Integer

  def reset: -> any
  def peek: -> any
  def poll_state: -> Integer
  def poke: (Integer) -> Integer
  def buttons: -> Integer
  def buttons=: (Integer) -> Integer
end

Optcarrot::Pad::A: Integer
Optcarrot::Pad::B: Integer
Optcarrot::Pad::SELECT: Integer
Optcarrot::Pad::START: Integer
Optcarrot::Pad::UP: Integer
Optcarrot::Pad::DOWN: Integer
Optcarrot::Pad::LEFT: Integer
Optcarrot::Pad::RIGHT: Integer
