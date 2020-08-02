defmodule My.Test.HatType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :FEDORA | :FEZ
  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.EnumDescriptorProto.decode(
      <<10, 7, 72, 97, 116, 84, 121, 112, 101, 18, 10, 10, 6, 70, 69, 68, 79, 82, 65, 16, 1, 18,
        7, 10, 3, 70, 69, 90, 16, 2>>
    )
  end

  field :FEDORA, 1
  field :FEZ, 2
end

defmodule My.Test.Days do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :MONDAY | :TUESDAY | :LUNDI
  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.EnumDescriptorProto.decode(
      <<10, 4, 68, 97, 121, 115, 18, 10, 10, 6, 77, 79, 78, 68, 65, 89, 16, 1, 18, 11, 10, 7, 84,
        85, 69, 83, 68, 65, 89, 16, 2, 18, 9, 10, 5, 76, 85, 78, 68, 73, 16, 1, 26, 4, 16, 1, 24,
        0>>
    )
  end

  field :MONDAY, 1
  field :TUESDAY, 2
  field :LUNDI, 1
end

defmodule My.Test.Request.Color do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :RED | :GREEN | :BLUE
  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.EnumDescriptorProto.decode(
      <<10, 5, 67, 111, 108, 111, 114, 18, 7, 10, 3, 82, 69, 68, 16, 0, 18, 9, 10, 5, 71, 82, 69,
        69, 78, 16, 1, 18, 8, 10, 4, 66, 76, 85, 69, 16, 2>>
    )
  end

  field :RED, 0
  field :GREEN, 1
  field :BLUE, 2
end

defmodule My.Test.Reply.Entry.Game do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto2

  @type t :: integer | :FOOTBALL | :TENNIS
  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.EnumDescriptorProto.decode(
      <<10, 4, 71, 97, 109, 101, 18, 12, 10, 8, 70, 79, 79, 84, 66, 65, 76, 76, 16, 1, 18, 10, 10,
        6, 84, 69, 78, 78, 73, 83, 16, 2>>
    )
  end

  field :FOOTBALL, 1
  field :TENNIS, 2
end

defmodule My.Test.Request.SomeGroup do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          group_field: integer
        }
  defstruct [:group_field]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 9, 83, 111, 109, 101, 71, 114, 111, 117, 112, 18, 31, 10, 11, 103, 114, 111, 117, 112,
        95, 102, 105, 101, 108, 100, 24, 9, 32, 1, 40, 5, 82, 10, 103, 114, 111, 117, 112, 70,
        105, 101, 108, 100>>
    )
  end

  field :group_field, 9, optional: true, type: :int32
end

defmodule My.Test.Request.NameMappingEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: integer,
          value: String.t()
        }
  defstruct [:key, :value]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 16, 78, 97, 109, 101, 77, 97, 112, 112, 105, 110, 103, 69, 110, 116, 114, 121, 18, 16,
        10, 3, 107, 101, 121, 24, 1, 32, 1, 40, 5, 82, 3, 107, 101, 121, 18, 20, 10, 5, 118, 97,
        108, 117, 101, 24, 2, 32, 1, 40, 9, 82, 5, 118, 97, 108, 117, 101, 58, 8, 8, 0, 16, 0, 24,
        0, 56, 1>>
    )
  end

  field :key, 1, optional: true, type: :int32
  field :value, 2, optional: true, type: :string
end

defmodule My.Test.Request.MsgMappingEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: integer,
          value: My.Test.Reply.t() | nil
        }
  defstruct [:key, :value]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 15, 77, 115, 103, 77, 97, 112, 112, 105, 110, 103, 69, 110, 116, 114, 121, 18, 16, 10,
        3, 107, 101, 121, 24, 1, 32, 1, 40, 18, 82, 3, 107, 101, 121, 18, 36, 10, 5, 118, 97, 108,
        117, 101, 24, 2, 32, 1, 40, 11, 50, 14, 46, 109, 121, 46, 116, 101, 115, 116, 46, 82, 101,
        112, 108, 121, 82, 5, 118, 97, 108, 117, 101, 58, 8, 8, 0, 16, 0, 24, 0, 56, 1>>
    )
  end

  field :key, 1, optional: true, type: :sint64
  field :value, 2, optional: true, type: My.Test.Reply
end

defmodule My.Test.Request do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          key: [integer],
          hue: My.Test.Request.Color.t(),
          hat: My.Test.HatType.t(),
          deadline: float | :infinity | :negative_infinity | :nan,
          somegroup: any,
          name_mapping: %{integer => String.t()},
          msg_mapping: %{integer => My.Test.Reply.t() | nil},
          reset: integer,
          get_key: String.t()
        }
  defstruct [
    :key,
    :hue,
    :hat,
    :deadline,
    :somegroup,
    :name_mapping,
    :msg_mapping,
    :reset,
    :get_key
  ]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 7, 82, 101, 113, 117, 101, 115, 116, 18, 16, 10, 3, 107, 101, 121, 24, 1, 32, 3, 40,
        3, 82, 3, 107, 101, 121, 18, 40, 10, 3, 104, 117, 101, 24, 3, 32, 1, 40, 14, 50, 22, 46,
        109, 121, 46, 116, 101, 115, 116, 46, 82, 101, 113, 117, 101, 115, 116, 46, 67, 111, 108,
        111, 114, 82, 3, 104, 117, 101, 18, 42, 10, 3, 104, 97, 116, 24, 4, 32, 1, 40, 14, 50, 16,
        46, 109, 121, 46, 116, 101, 115, 116, 46, 72, 97, 116, 84, 121, 112, 101, 58, 6, 70, 69,
        68, 79, 82, 65, 82, 3, 104, 97, 116, 18, 31, 10, 8, 100, 101, 97, 100, 108, 105, 110, 101,
        24, 7, 32, 1, 40, 2, 58, 3, 105, 110, 102, 82, 8, 100, 101, 97, 100, 108, 105, 110, 101,
        18, 56, 10, 9, 115, 111, 109, 101, 103, 114, 111, 117, 112, 24, 8, 32, 1, 40, 10, 50, 26,
        46, 109, 121, 46, 116, 101, 115, 116, 46, 82, 101, 113, 117, 101, 115, 116, 46, 83, 111,
        109, 101, 71, 114, 111, 117, 112, 82, 9, 115, 111, 109, 101, 103, 114, 111, 117, 112, 18,
        68, 10, 12, 110, 97, 109, 101, 95, 109, 97, 112, 112, 105, 110, 103, 24, 14, 32, 3, 40,
        11, 50, 33, 46, 109, 121, 46, 116, 101, 115, 116, 46, 82, 101, 113, 117, 101, 115, 116,
        46, 78, 97, 109, 101, 77, 97, 112, 112, 105, 110, 103, 69, 110, 116, 114, 121, 82, 11,
        110, 97, 109, 101, 77, 97, 112, 112, 105, 110, 103, 18, 65, 10, 11, 109, 115, 103, 95,
        109, 97, 112, 112, 105, 110, 103, 24, 15, 32, 3, 40, 11, 50, 32, 46, 109, 121, 46, 116,
        101, 115, 116, 46, 82, 101, 113, 117, 101, 115, 116, 46, 77, 115, 103, 77, 97, 112, 112,
        105, 110, 103, 69, 110, 116, 114, 121, 82, 10, 109, 115, 103, 77, 97, 112, 112, 105, 110,
        103, 18, 20, 10, 5, 114, 101, 115, 101, 116, 24, 12, 32, 1, 40, 5, 82, 5, 114, 101, 115,
        101, 116, 18, 23, 10, 7, 103, 101, 116, 95, 107, 101, 121, 24, 16, 32, 1, 40, 9, 82, 6,
        103, 101, 116, 75, 101, 121, 26, 44, 10, 9, 83, 111, 109, 101, 71, 114, 111, 117, 112, 18,
        31, 10, 11, 103, 114, 111, 117, 112, 95, 102, 105, 101, 108, 100, 24, 9, 32, 1, 40, 5, 82,
        10, 103, 114, 111, 117, 112, 70, 105, 101, 108, 100, 26, 68, 10, 16, 78, 97, 109, 101, 77,
        97, 112, 112, 105, 110, 103, 69, 110, 116, 114, 121, 18, 16, 10, 3, 107, 101, 121, 24, 1,
        32, 1, 40, 5, 82, 3, 107, 101, 121, 18, 20, 10, 5, 118, 97, 108, 117, 101, 24, 2, 32, 1,
        40, 9, 82, 5, 118, 97, 108, 117, 101, 58, 8, 8, 0, 16, 0, 24, 0, 56, 1, 26, 83, 10, 15,
        77, 115, 103, 77, 97, 112, 112, 105, 110, 103, 69, 110, 116, 114, 121, 18, 16, 10, 3, 107,
        101, 121, 24, 1, 32, 1, 40, 18, 82, 3, 107, 101, 121, 18, 36, 10, 5, 118, 97, 108, 117,
        101, 24, 2, 32, 1, 40, 11, 50, 14, 46, 109, 121, 46, 116, 101, 115, 116, 46, 82, 101, 112,
        108, 121, 82, 5, 118, 97, 108, 117, 101, 58, 8, 8, 0, 16, 0, 24, 0, 56, 1, 34, 37, 10, 5,
        67, 111, 108, 111, 114, 18, 7, 10, 3, 82, 69, 68, 16, 0, 18, 9, 10, 5, 71, 82, 69, 69, 78,
        16, 1, 18, 8, 10, 4, 66, 76, 85, 69, 16, 2>>
    )
  end

  field :key, 1, repeated: true, type: :int64
  field :hue, 3, optional: true, type: My.Test.Request.Color, enum: true
  field :hat, 4, optional: true, type: My.Test.HatType, default: :FEDORA, enum: true
  field :deadline, 7, optional: true, type: :float, default: "inf"
  field :somegroup, 8, optional: true, type: :group
  field :name_mapping, 14, repeated: true, type: My.Test.Request.NameMappingEntry, map: true
  field :msg_mapping, 15, repeated: true, type: My.Test.Request.MsgMappingEntry, map: true
  field :reset, 12, optional: true, type: :int32
  field :get_key, 16, optional: true, type: :string
end

defmodule My.Test.Reply.Entry do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          key_that_needs_1234camel_CasIng: integer,
          value: integer,
          _my_field_name_2: integer
        }
  defstruct [:key_that_needs_1234camel_CasIng, :value, :_my_field_name_2]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 5, 69, 110, 116, 114, 121, 18, 68, 10, 31, 107, 101, 121, 95, 116, 104, 97, 116, 95,
        110, 101, 101, 100, 115, 95, 49, 50, 51, 52, 99, 97, 109, 101, 108, 95, 67, 97, 115, 73,
        110, 103, 24, 1, 32, 2, 40, 3, 82, 27, 107, 101, 121, 84, 104, 97, 116, 78, 101, 101, 100,
        115, 49, 50, 51, 52, 99, 97, 109, 101, 108, 67, 97, 115, 73, 110, 103, 18, 23, 10, 5, 118,
        97, 108, 117, 101, 24, 2, 32, 1, 40, 3, 58, 1, 55, 82, 5, 118, 97, 108, 117, 101, 18, 38,
        10, 16, 95, 109, 121, 95, 102, 105, 101, 108, 100, 95, 110, 97, 109, 101, 95, 50, 24, 3,
        32, 1, 40, 3, 82, 12, 77, 121, 70, 105, 101, 108, 100, 78, 97, 109, 101, 50, 34, 32, 10,
        4, 71, 97, 109, 101, 18, 12, 10, 8, 70, 79, 79, 84, 66, 65, 76, 76, 16, 1, 18, 10, 10, 6,
        84, 69, 78, 78, 73, 83, 16, 2>>
    )
  end

  field :key_that_needs_1234camel_CasIng, 1, required: true, type: :int64
  field :value, 2, optional: true, type: :int64, default: 7
  field :_my_field_name_2, 3, optional: true, type: :int64
end

defmodule My.Test.Reply do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          found: [My.Test.Reply.Entry.t()],
          compact_keys: [integer],
          __pb_extensions__: map
        }
  defstruct [:found, :compact_keys, :__pb_extensions__]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 5, 82, 101, 112, 108, 121, 18, 42, 10, 5, 102, 111, 117, 110, 100, 24, 1, 32, 3, 40,
        11, 50, 20, 46, 109, 121, 46, 116, 101, 115, 116, 46, 82, 101, 112, 108, 121, 46, 69, 110,
        116, 114, 121, 82, 5, 102, 111, 117, 110, 100, 18, 43, 10, 12, 99, 111, 109, 112, 97, 99,
        116, 95, 107, 101, 121, 115, 24, 2, 32, 3, 40, 5, 66, 8, 16, 1, 24, 0, 40, 0, 80, 0, 82,
        11, 99, 111, 109, 112, 97, 99, 116, 75, 101, 121, 115, 26, 176, 1, 10, 5, 69, 110, 116,
        114, 121, 18, 68, 10, 31, 107, 101, 121, 95, 116, 104, 97, 116, 95, 110, 101, 101, 100,
        115, 95, 49, 50, 51, 52, 99, 97, 109, 101, 108, 95, 67, 97, 115, 73, 110, 103, 24, 1, 32,
        2, 40, 3, 82, 27, 107, 101, 121, 84, 104, 97, 116, 78, 101, 101, 100, 115, 49, 50, 51, 52,
        99, 97, 109, 101, 108, 67, 97, 115, 73, 110, 103, 18, 23, 10, 5, 118, 97, 108, 117, 101,
        24, 2, 32, 1, 40, 3, 58, 1, 55, 82, 5, 118, 97, 108, 117, 101, 18, 38, 10, 16, 95, 109,
        121, 95, 102, 105, 101, 108, 100, 95, 110, 97, 109, 101, 95, 50, 24, 3, 32, 1, 40, 3, 82,
        12, 77, 121, 70, 105, 101, 108, 100, 78, 97, 109, 101, 50, 34, 32, 10, 4, 71, 97, 109,
        101, 18, 12, 10, 8, 70, 79, 79, 84, 66, 65, 76, 76, 16, 1, 18, 10, 10, 6, 84, 69, 78, 78,
        73, 83, 16, 2, 42, 8, 8, 100, 16, 128, 128, 128, 128, 2>>
    )
  end

  field :found, 1, repeated: true, type: My.Test.Reply.Entry
  field :compact_keys, 2, repeated: true, type: :int32, packed: true

  extensions [{100, 536_870_912}]
end

defmodule My.Test.OtherBase do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          __pb_extensions__: map
        }
  defstruct [:name, :__pb_extensions__]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 9, 79, 116, 104, 101, 114, 66, 97, 115, 101, 18, 18, 10, 4, 110, 97, 109, 101, 24, 1,
        32, 1, 40, 9, 82, 4, 110, 97, 109, 101, 42, 8, 8, 100, 16, 128, 128, 128, 128, 2>>
    )
  end

  field :name, 1, optional: true, type: :string

  extensions [{100, 536_870_912}]
end

defmodule My.Test.ReplyExtensions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 15, 82, 101, 112, 108, 121, 69, 120, 116, 101, 110, 115, 105, 111, 110, 115, 50, 34,
        10, 4, 116, 105, 109, 101, 18, 14, 46, 109, 121, 46, 116, 101, 115, 116, 46, 82, 101, 112,
        108, 121, 24, 101, 32, 1, 40, 1, 82, 4, 116, 105, 109, 101, 50, 64, 10, 6, 99, 97, 114,
        114, 111, 116, 18, 14, 46, 109, 121, 46, 116, 101, 115, 116, 46, 82, 101, 112, 108, 121,
        24, 105, 32, 1, 40, 11, 50, 24, 46, 109, 121, 46, 116, 101, 115, 116, 46, 82, 101, 112,
        108, 121, 69, 120, 116, 101, 110, 115, 105, 111, 110, 115, 82, 6, 99, 97, 114, 114, 111,
        116, 50, 66, 10, 5, 100, 111, 110, 117, 116, 18, 18, 46, 109, 121, 46, 116, 101, 115, 116,
        46, 79, 116, 104, 101, 114, 66, 97, 115, 101, 24, 101, 32, 1, 40, 11, 50, 24, 46, 109,
        121, 46, 116, 101, 115, 116, 46, 82, 101, 112, 108, 121, 69, 120, 116, 101, 110, 115, 105,
        111, 110, 115, 82, 5, 100, 111, 110, 117, 116>>
    )
  end
end

defmodule My.Test.OtherReplyExtensions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          key: integer
        }
  defstruct [:key]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 20, 79, 116, 104, 101, 114, 82, 101, 112, 108, 121, 69, 120, 116, 101, 110, 115, 105,
        111, 110, 115, 18, 16, 10, 3, 107, 101, 121, 24, 1, 32, 1, 40, 5, 82, 3, 107, 101, 121>>
    )
  end

  field :key, 1, optional: true, type: :int32
end

defmodule My.Test.OldReply do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{__pb_extensions__: map}
  defstruct [:__pb_extensions__]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 8, 79, 108, 100, 82, 101, 112, 108, 121, 42, 8, 8, 100, 16, 255, 255, 255, 255, 7, 58,
        6, 8, 1, 16, 0, 24, 0>>
    )
  end

  extensions [{100, 2_147_483_647}]
end

defmodule My.Test.Communique.SomeGroup do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          member: String.t()
        }
  defstruct [:member]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 9, 83, 111, 109, 101, 71, 114, 111, 117, 112, 18, 22, 10, 6, 109, 101, 109, 98, 101,
        114, 24, 15, 32, 1, 40, 9, 82, 6, 109, 101, 109, 98, 101, 114>>
    )
  end

  field :member, 15, optional: true, type: :string
end

defmodule My.Test.Communique.Delta do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(<<10, 5, 68, 101, 108, 116, 97>>)
  end
end

defmodule My.Test.Communique do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          union: {atom, any},
          make_me_cry: boolean
        }
  defstruct [:union, :make_me_cry]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 10, 67, 111, 109, 109, 117, 110, 105, 113, 117, 101, 18, 30, 10, 11, 109, 97, 107,
        101, 95, 109, 101, 95, 99, 114, 121, 24, 1, 32, 1, 40, 8, 82, 9, 109, 97, 107, 101, 77,
        101, 67, 114, 121, 18, 24, 10, 6, 110, 117, 109, 98, 101, 114, 24, 5, 32, 1, 40, 5, 72, 0,
        82, 6, 110, 117, 109, 98, 101, 114, 18, 20, 10, 4, 110, 97, 109, 101, 24, 6, 32, 1, 40, 9,
        72, 0, 82, 4, 110, 97, 109, 101, 18, 20, 10, 4, 100, 97, 116, 97, 24, 7, 32, 1, 40, 12,
        72, 0, 82, 4, 100, 97, 116, 97, 18, 23, 10, 6, 116, 101, 109, 112, 95, 99, 24, 8, 32, 1,
        40, 1, 72, 0, 82, 5, 116, 101, 109, 112, 67, 18, 24, 10, 6, 104, 101, 105, 103, 104, 116,
        24, 9, 32, 1, 40, 2, 72, 0, 82, 6, 104, 101, 105, 103, 104, 116, 18, 37, 10, 5, 116, 111,
        100, 97, 121, 24, 10, 32, 1, 40, 14, 50, 13, 46, 109, 121, 46, 116, 101, 115, 116, 46, 68,
        97, 121, 115, 72, 0, 82, 5, 116, 111, 100, 97, 121, 18, 22, 10, 5, 109, 97, 121, 98, 101,
        24, 11, 32, 1, 40, 8, 72, 0, 82, 5, 109, 97, 121, 98, 101, 18, 22, 10, 5, 100, 101, 108,
        116, 97, 24, 12, 32, 1, 40, 17, 72, 0, 82, 5, 100, 101, 108, 116, 97, 18, 34, 10, 3, 109,
        115, 103, 24, 13, 32, 1, 40, 11, 50, 14, 46, 109, 121, 46, 116, 101, 115, 116, 46, 82,
        101, 112, 108, 121, 72, 0, 82, 3, 109, 115, 103, 18, 61, 10, 9, 115, 111, 109, 101, 103,
        114, 111, 117, 112, 24, 14, 32, 1, 40, 10, 50, 29, 46, 109, 121, 46, 116, 101, 115, 116,
        46, 67, 111, 109, 109, 117, 110, 105, 113, 117, 101, 46, 83, 111, 109, 101, 71, 114, 111,
        117, 112, 72, 0, 82, 9, 115, 111, 109, 101, 103, 114, 111, 117, 112, 26, 35, 10, 9, 83,
        111, 109, 101, 71, 114, 111, 117, 112, 18, 22, 10, 6, 109, 101, 109, 98, 101, 114, 24, 15,
        32, 1, 40, 9, 82, 6, 109, 101, 109, 98, 101, 114, 26, 7, 10, 5, 68, 101, 108, 116, 97, 66,
        7, 10, 5, 117, 110, 105, 111, 110>>
    )
  end

  oneof :union, 0

  field :make_me_cry, 1, optional: true, type: :bool
  field :number, 5, optional: true, type: :int32, oneof: 0
  field :name, 6, optional: true, type: :string, oneof: 0
  field :data, 7, optional: true, type: :bytes, oneof: 0
  field :temp_c, 8, optional: true, type: :double, oneof: 0
  field :height, 9, optional: true, type: :float, oneof: 0
  field :today, 10, optional: true, type: My.Test.Days, enum: true, oneof: 0
  field :maybe, 11, optional: true, type: :bool, oneof: 0
  field :delta, 12, optional: true, type: :sint32, oneof: 0
  field :msg, 13, optional: true, type: My.Test.Reply, oneof: 0
  field :somegroup, 14, optional: true, type: :group, oneof: 0
end

defmodule My.Test.Options do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          opt1: String.t()
        }
  defstruct [:opt1]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 7, 79, 112, 116, 105, 111, 110, 115, 18, 26, 10, 4, 111, 112, 116, 49, 24, 1, 32, 1,
        40, 9, 66, 6, 24, 1, 40, 0, 80, 0, 82, 4, 111, 112, 116, 49>>
    )
  end

  field :opt1, 1, optional: true, type: :string, deprecated: true
end

defmodule My.Test.Foo do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          buzz: String.t(),
          bar: boolean
        }
  defstruct [:buzz, :bar]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 3, 70, 111, 111, 18, 18, 10, 4, 98, 117, 122, 122, 24, 1, 32, 1, 40, 9, 82, 4, 98,
        117, 122, 122, 18, 16, 10, 3, 98, 97, 114, 24, 2, 32, 1, 40, 8, 82, 3, 98, 97, 114>>
    )
  end

  field :buzz, 1, optional: true, type: :string
  field :bar, 2, optional: true, type: :bool
end

defmodule My.Test.Baz do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          fizz: String.t()
        }
  defstruct [:fizz]

  def descriptor do
    # credo:disable-for-next-line
    Elixir.Google.Protobuf.DescriptorProto.decode(
      <<10, 3, 66, 97, 122, 18, 26, 10, 4, 102, 105, 122, 122, 24, 1, 32, 1, 40, 9, 66, 6, 24, 0,
        40, 0, 80, 0, 82, 4, 102, 105, 122, 122>>
    )
  end

  field :fizz, 1, optional: true, type: :string
end

defmodule My.Test.PbExtension do
  @moduledoc false
  use Protobuf, syntax: :proto2

  extend My.Test.Reply, :tag, 103, optional: true, type: :string
  extend My.Test.Reply, :donut, 106, optional: true, type: My.Test.OtherReplyExtensions
  extend Google.Protobuf.FieldOptions, :foo, 1000, optional: true, type: My.Test.Foo
  extend My.Test.Reply, :"ReplyExtensions.time", 101, optional: true, type: :double

  extend My.Test.Reply, :"ReplyExtensions.carrot", 105,
    optional: true,
    type: My.Test.ReplyExtensions

  extend My.Test.OtherBase, :"ReplyExtensions.donut", 101,
    optional: true,
    type: My.Test.ReplyExtensions
end
