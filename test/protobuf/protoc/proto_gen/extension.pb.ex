defmodule Protobuf.Protoc.ExtTest.Foo do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          a: String.t()
        }
  defstruct [:a]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 3, 70, 111, 111, 18, 12, 10, 1, 97, 24, 1, 32, 1, 40, 9, 82, 1, 97>>
    )
  end

  field :a, 1, optional: true, type: :string
end
