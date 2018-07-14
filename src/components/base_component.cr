require "./shared/field"

abstract class BaseComponent
  include Lucky::HTMLBuilder
  include Shared::Field

  needs view : IO::Memory
end
