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

module Optcarrot::Palette
  def self?.defacto_palette: -> Array<Array<Integer>>
  def self?.nestopia_palette: -> Array<Array<Integer>>
end

class Optcarrot::ROM
  @mirroring: Symbol
  @battery: _Boolean
  @mapper: Integer
  @conf: any
  @cpu: any
  @ppu: any
  @basename: String
  @prg_banks: Array<Array<Integer>>
  @chr_banks: Array<Array<Integer>>
  @prg_ref: Array<Integer>
  @chr_ram: _Boolean
  @chr_ref: Array<Integer>
  @wrk_readable: _Boolean
  @wrk_writable: _Boolean
  @wrk: Array<Integer>

  def self.zip_extract: (String) -> String
  def self.load: (any, any, any) -> any
  def parse_header: (Array<Integer>) -> Array<Integer>
  def initialize: (any, any, any, String, Array<Integer>) -> any
  def init: -> void
  def peek_6000: (Integer) -> Integer
  def poke_6000: (Integer, Integer) -> void
  def vsync: -> void
  def load_battery: -> void
  def save_battery: -> void
end

Optcarrot::ROM::MAPPER_DB: Hash<Integer, Optcarrot::ROM.class constructor>

class Optcarrot::NotImplementedError
end
class Optcarrot::InvalidROM
end

class Optcarrot::PPU
  @conf: any
  @cpu: any
  @palette: Array<Array<Integer>>
  @nmt_mem: Array<Array<Integer>>
  @nmt_ref: Array<Array<Integer>>
  @output_pixels: Array<Integer>
  @output_color: Array<Array<Integer>>
  @palette_ram: Array<Integer>
  @coloring: Integer
  @emphasis: Integer

  def initialize: (any, any, Array<Array<Integer>>) -> any
  def reset: (?mapping: _Boolean) -> any
  def update_output_color: () -> void
  def setup_lut: -> void
  def output_pixels: -> void

  def sync: (Integer) -> void
end

class Optcarrot::OptimizedCodeBuilder
  def initialize: (any, any) -> any
  def build: () -> any
end

Optcarrot::PPU::RP2C02_CC: Integer
Optcarrot::PPU::RP2C02_HACTIVE: Integer
Optcarrot::PPU::RP2C02_HBLANK: Integer
Optcarrot::PPU::RP2C02_HSYNC: Integer
Optcarrot::PPU::RP2C02_VACTIVE: Integer
Optcarrot::PPU::RP2C02_VSLEEP: Integer
Optcarrot::PPU::RP2C02_VINT: Integer
Optcarrot::PPU::RP2C02_VDUMMY: Integer
Optcarrot::PPU::RP2C02_VBLANK: Integer
Optcarrot::PPU::RP2C02_VSYNC: Integer
Optcarrot::PPU::RP2C02_HVSYNCBOOT: Integer
Optcarrot::PPU::RP2C02_HVINT: Integer
Optcarrot::PPU::RP2C02_HVSYNC_0: Integer
Optcarrot::PPU::RP2C02_HVSYNC_1: Integer
Optcarrot::PPU::SCANLINE_HDUMMY: Integer
Optcarrot::PPU::SCANLINE_VBLANK: Integer
Optcarrot::PPU::HCLOCK_DUMMY: Integer
Optcarrot::PPU::HCLOCK_VBLANK_0: Integer
Optcarrot::PPU::HCLOCK_VBLANK_1: Integer
Optcarrot::PPU::HCLOCK_VBLANK_2: Integer
Optcarrot::PPU::HCLOCK_BOOT: Integer
Optcarrot::PPU::DUMMY_FRAME: Array<Integer>
Optcarrot::PPU::BOOT_FRAME: Array<Integer>
Optcarrot::PPU::SP_PIXEL_POSITIONS: Hash<Integer, Array<Integer>>
Optcarrot::PPU::TILE_LUT: Array<Array<Integer>>

Optcarrot::FOREVER_CLOCK: Integer
Optcarrot::RP2A03_CC: Integer






class Optcarrot::CPU
  @conf: any
  @fetch: Array<Array<Integer>>
  @store: Array<Array<Integer>>
  @peeks: Hash<Integer, Integer>
  @pokes: Hash<Integer, Integer>
  @ram: Array<Integer>
  @clk: Integer
  @clk_frame: Integer
  @clk_target: Integer
  @clk_nmi: Integer
  @clk_irq: Integer
  @clk_total: Integer
  @irq_flags: Integer
  @jammed: _Boolean
  @addr: Integer
  @data: Integer
  @opcode: any
  @ppu_sync: _Boolean
  @_a: Integer
  @_x: Integer
  @_y: Integer
  @_sp: Integer
  @_pc: Integer
  @_p_nz: Integer
  @_p_c: Integer
  @_p_v: Integer
  @_p_i: Integer
  @_p_d: Integer
  @apu: any
  @ppu: PPU

  def initialize: (any) -> any
  def reset: () -> any
  def peek_ram: (Integer) -> void
  def poke_ram: (Integer, Integer) -> void
  def peek_nop: (Integer) -> Integer
  def peek_jam_1: (Integer) -> Integer
  def peek_jam_2: (Integer) -> Integer
  def add_mappings: (Integer, any, any) -> void
                  | (Range<Integer>, any, any) -> void
  def fetch: (Integer) -> Integer
  def store: (Integer, Integer) -> Array<Integer>
  def peek16: (Integer) -> Integer
  def current_clock: () -> Integer
  def next_frame_clock: () -> Integer
  def next_frame_clock=: (Integer) -> void
  def steal_clocks: (Integer) -> void
  def odd_clock?: () -> _Boolean
  def update: () -> Integer
  def dmc_dma: (Integer) -> Integer
  def sprite_dma: (Integer, Array<Integer>) -> void
  def boot: () -> void
  def vsync: () -> void
  def clear_irq: (Integer) -> Integer
  def next_interrupt_clock: (Integer) -> Integer
  def do_irq: (Integer, Integer) -> void
  def do_nmi: (Integer) -> void
  def do_isr: (Integer) -> void
  def fetch_irq_isr_vector: () -> Integer
  def flags_pack: () -> Integer
  def flags_unpack: (Integer) -> void
  def branch: (any) -> void
  def store_mem: () -> void
  def store_zpg: () -> void
  def push8: (Integer) -> void
  def push16: (Integer) -> void
  def pull8: () -> Integer
  def pull16: () -> Integer
  def imm: (any, any) -> void
  def zpg: (Integer, Integer) -> void
  def zpg_reg: (Integer, Integer, Integer) -> void
  def zpg_x: (Integer, Integer) -> void
  def zpg_y: (Integer, Integer) -> void
  def abs: (Integer, Integer) -> void
  def abs_reg: (Integer, Integer, Integer) -> void
  def abs_x: (Integer, Integer) -> void
  def abs_y: (Integer, Integer) -> void
  def ind_x: (Integer, Integer) -> void
  def ind_y: (Integer, Integer) -> void
  def read_write: (Integer, Integer) -> void
  def _lda: () -> void
  def _ldx: () -> void
  def _ldy: () -> void
  def _sta: () -> void
  def _stx: () -> void
  def _sty: () -> void
  def _tax: () -> void
  def _tay: () -> void
  def _txa: () -> void
  def _tya: () -> void
  def _jmp_a: () -> void
  def _jmp_i: () -> void
  def _jsr: () -> void
  def _rts: () -> void
  def _rti: () -> void
  def _bne: () -> void
  def _beq: () -> void
  def _bmi: () -> void
  def _bpl: () -> void
  def _bcs: () -> void
  def _bcc: () -> void
  def _bvs: () -> void
  def _bvc: () -> void
  def _adc: () -> void
  def _sbc: () -> void
  def _and: () -> void
  def _ora: () -> void
  def _eor: () -> void
  def _bit: () -> void
  def _cmp: () -> void
  def _cpx: () -> void
  def _cpy: () -> void
  def _asl: () -> void
  def _lsr: () -> void
  def _rol: () -> void
  def _ror: () -> void
  def _dec: () -> void
  def _inc: () -> void
  def _dex: () -> void
  def _dey: () -> void
  def _inx: () -> void
  def _iny: () -> void
  def _clc: () -> void
  def _sec: () -> void
  def _cld: () -> void
  def _sed: () -> void
  def _clv: () -> void
  def _sei: () -> void
  def _cli: () -> void
  def _pha: () -> void
  def _php: () -> void
  def _pla: () -> void
  def _plp: () -> void
  def _tsx: () -> void
  def _txs: () -> void
  def _anc: () -> void
  def _ane: () -> void
  def _arr: () -> void
  def _asr: () -> void
  def _dcp: () -> void
  def _isb: () -> void
  def _las: () -> void
  def _lax: () -> void
  def _lxa: () -> void
  def _rla: () -> void
  def _rra: () -> void
  def _sax: () -> void
  def _sbx: () -> void
  def _sha: () -> void
  def _shs: () -> void
  def _shx: () -> void
  def _shy: () -> void
  def _slo: () -> void
  def _sre: () -> void
  def _nop: () -> void
  def _brk: () -> void
  def _jam: () -> void
  def r_op: (Symbol, Symbol) -> void
  def w_op: (Symbol, Symbol, Symbol) -> void
  def rw_op: (Symbol, Symbol, Symbol) -> void
  def a_op: (Symbol) -> void
  def no_op: (Symbol, Integer, Integer) -> void
  def do_clock: () -> void
  def run: () -> void
  def self.poke_nop: (any, any) -> void
  def self.op: (Array<Integer>, Array<Symbol> | Array<Symbol | Integer> | Symbol) -> void
end

class Optcarrot::CPU::OptimizedCodeBuilder
  include CodeOptimizationHelper

  @method_inlining: any
  @trivial_branches: any
  @constant_inlining: any
  @ivar_localization: any
  def build: () -> String
  def build_loop: (Hash<Symbol, any>) -> String
  def cpu_expand_methods: (String, Hash<Symbol, any>) -> String
  def expand_constants: (String) -> String
end

Optcarrot::CPU::NMI_VECTOR: Integer
Optcarrot::CPU::RESET_VECTOR: Integer
Optcarrot::CPU::IRQ_VECTOR: Integer
Optcarrot::CPU::IRQ_EXT: Integer
Optcarrot::CPU::IRQ_FRAME: Integer
Optcarrot::CPU::IRQ_DMC: Integer
Optcarrot::CPU::CLK_1: Integer
Optcarrot::CPU::CLK_2: Integer
Optcarrot::CPU::CLK_3: Integer
Optcarrot::CPU::CLK_4: Integer
Optcarrot::CPU::CLK_5: Integer
Optcarrot::CPU::CLK_6: Integer
Optcarrot::CPU::CLK_7: Integer
Optcarrot::CPU::CLK_8: Integer
Optcarrot::CPU::PokeNop: any
Optcarrot::CPU::ADDRESSING_MODES: Hash<Symbol, Array<Symbol>>
Optcarrot::CPU::DISPATCH: Array<Array<any>>
Optcarrot::CPU::OptimizedCodeBuilder::OPTIONS: Array<Symbol>
Optcarrot::CPU::OptimizedCodeBuilder::LOCALIZE_IVARS: Array<Symbol>

module Optcarrot::CodeOptimizationHelper : Object
  @loglevel: Integer
  def initialize: (Integer, Array<Symbol>) -> any
  def depends: (Symbol, Symbol) -> void
  def gen: (*String) -> String
  def indent: (Integer, String) -> String
  def branch: (String, String, String) -> String
  def parse_method_definitions: (String) -> Hash<Symbol, MethodDef>
  def expand_methods: (String, Hash<Symbol, MethodDef | String>, ?Array<Symbol>) -> String
  def expand_inline_methods: (String, Symbol, MethodDef) -> String
  def replace_var: (String, String, String) -> String
  def replace_cond_var: (String, String, String) -> String
  def remove_trivial_branches: (String) -> String
  def localize_instance_variables: (String, ?Array<String> | Array<Symbol>) -> String
end

class Optcarrot::CodeOptimizationHelper::MethodDef
  def self.[]: (Array<String>, String) -> instance
  def params: -> Array<String>
  def body: -> String
end

Optcarrot::CodeOptimizationHelper::METHOD_DEFINITIONS_RE: Regexp
Optcarrot::CodeOptimizationHelper::TRIVIAL_BRANCH_RE: Regexp
