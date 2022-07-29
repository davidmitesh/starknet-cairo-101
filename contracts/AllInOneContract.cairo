# ######## Ex 01
# # Using a simple public contract function
# In this exercice, you need to:
# - Use this contract's claim_points() function
# - Your points are credited by the contract

# # What you'll learn
# - General smart contract syntax
# - Calling a function

# ######## General directives and imports
#
#

%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.starknet.common.syscalls import get_contract_address, get_caller_address
from starkware.cairo.common.alloc import alloc
from contracts.utils.Iex10b import Iex10b
from contracts.token.IERC20 import IERC20
@contract_interface
namespace ex01:
    func claim_points():
    end
end

@contract_interface
namespace ex02:
    func my_secret_value() -> (my_secret_value : felt):
    end

    func claim_points(my_value : felt):
    end
end

@contract_interface
namespace ex03:
    func increment_counter():
    end

    func reset_counter():
    end

    func decrement_counter():
    end

    func claim_points():
    end
end

@contract_interface
namespace ex04:
    func user_slots(account : felt) -> (user_slot : felt):
    end

    func values_mapped(slot : felt) -> (value : felt):
    end

    func assign_user_slot():
    end

    func claim_points(expected_value : felt):
    end
end

@contract_interface
namespace ex05:
    func user_values(account : felt) -> (user_value : felt):
    end

    func assign_user_slot():
    end

    func copy_secret_value_to_readable_mapping():
    end

    func claim_points(expected_value : felt):
    end
end

@contract_interface
namespace ex06:
    func user_values(account : felt) -> (user_value : felt):
    end

    func assign_user_slot():
    end

    func external_handler_for_internal_function(a_value : felt):
    end

    func claim_points(expected_value : felt):
    end
end

@contract_interface
namespace ex07:
    func claim_points(value_a : felt, value_b : felt):
    end
end

@contract_interface
namespace ex08:
    func claim_points():
    end

    func set_user_values(account : felt, array_len : felt, array : felt*):
    end
end

@contract_interface
namespace ex09:
    func claim_points(array_len : felt, array : felt*):
    end
end

@contract_interface
namespace ex10:
    func ex10b_address() -> (ex10b_address : felt):
    end

    func claim_points(secret_value_i_guess : felt, next_secret_value_i_chose : felt):
    end
end

@contract_interface
namespace ex14:
    func claim_points():
    end
end

@external
func validate_various_exercises{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr}(
    ):
    # This call should collect at least 20 points from various exercises to get tokens to the contract.
    let (currentContractAddress) = get_contract_address()
    # Now solving exercise 1
    let exercise_1_contract_address = 1591509280391971671979263777446171019412522583809867665188727628997529900662
    ex01.claim_points(contract_address=exercise_1_contract_address)

    # Now solving exercise 2
    let exercise_2_contract_address = 1067517588230639979884133346766193897095551944895293625855280238365728443292
    let (ex02_secret_value) = ex02.my_secret_value(contract_address=exercise_2_contract_address)
    ex02.claim_points(contract_address=exercise_2_contract_address, my_value=ex02_secret_value)

    # Now solving exercise 3
    let exercise_3_contract_address = 1086432947465216110691557072517050993057749394602776175826262695484039541684
    ex03.reset_counter(contract_address=exercise_3_contract_address)
    ex03.increment_counter(contract_address=exercise_3_contract_address)  # each increment counter adds 2 points
    ex03.increment_counter(contract_address=exercise_3_contract_address)
    ex03.increment_counter(contract_address=exercise_3_contract_address)
    ex03.increment_counter(contract_address=exercise_3_contract_address)
    ex03.decrement_counter(contract_address=exercise_3_contract_address)  # each decrement counter subtracts 1 point
    ex03.claim_points(contract_address=exercise_3_contract_address)

    # Now solving exercise 4
    let exercise_4_contract_address = 3387262466780441900417273633747175144517715037121646293535032175584868800957
    ex04.assign_user_slot(contract_address=exercise_4_contract_address)
    let (user_slot) = ex04.user_slots(
        contract_address=exercise_4_contract_address, account=currentContractAddress
    )
    let (value) = ex04.values_mapped(contract_address=exercise_4_contract_address, slot=user_slot)
    ex04.claim_points(contract_address=exercise_4_contract_address, expected_value=value - 32)

    # Now solving exercise 5
    let exercise_5_contract_address = 1762046160852852348940801088815614098417952288856208564245207920905000448998
    ex05.assign_user_slot(contract_address=exercise_5_contract_address)
    ex05.copy_secret_value_to_readable_mapping(contract_address=exercise_5_contract_address)
    let (user_value) = ex05.user_values(
        contract_address=exercise_5_contract_address, account=currentContractAddress
    )
    ex05.claim_points(contract_address=exercise_5_contract_address, expected_value=user_value)

    # Now solving exercise 6
    let exercise_6_contract_address = 20060496102257455600952910040875378345224184951565231801940795314124484036
    ex06.assign_user_slot(contract_address=exercise_6_contract_address)
    ex06.external_handler_for_internal_function(
        contract_address=exercise_6_contract_address, a_value=0
    )
    let (user_value) = ex06.user_values(
        contract_address=exercise_6_contract_address, account=currentContractAddress
    )
    ex06.claim_points(contract_address=exercise_6_contract_address, expected_value=user_value)

    # Now solving exercise 7
    let exercise_7_contract_address = 230389261848598402870989060543424359496095982338256312561780370558236733440
    ex07.claim_points(contract_address=exercise_7_contract_address, value_a=50, value_b=0)

    # Now solving exercise 8

    let exercise_8_contract_address = 1248172035032622887861381778063216478160411922890533069353323963749694576431
    let (numbers_array : felt*) = alloc()
    assert [numbers_array] = 10
    assert [numbers_array + 1] = 10
    assert [numbers_array + 2] = 10
    assert [numbers_array + 3] = 10
    assert [numbers_array + 4] = 10
    assert [numbers_array + 5] = 10
    assert [numbers_array + 6] = 10
    assert [numbers_array + 7] = 10
    assert [numbers_array + 8] = 10
    assert [numbers_array + 9] = 10
    assert [numbers_array + 10] = 10

    ex08.set_user_values(
        contract_address=exercise_8_contract_address,
        account=currentContractAddress,
        array_len=11,
        array=numbers_array,
    )
    ex08.claim_points(contract_address=exercise_8_contract_address)

    # Now solving exercise 9

    let exercise_9_contract_address = 357440137401702541001161216925035617424867493600456948346632631645015912369
    let (numbers_array : felt*) = alloc()
    assert [numbers_array] = 220
    assert [numbers_array + 1] = 73
    assert [numbers_array + 2] = 25
    assert [numbers_array + 3] = 10
    assert [numbers_array + 4] = 1
    ex09.claim_points(
        contract_address=exercise_9_contract_address, array_len=5, array=numbers_array
    )

    # Now solving exercise 10
    let exercise_10_contract_address = 704471897108014414393459224136267066228147055654991659861659135062124782477
    let (exercise_10b_address) = ex10.ex10b_address(contract_address=exercise_10_contract_address)
    let (secret_value) = Iex10b.secret_value(contract_address=exercise_10b_address)
    ex10.claim_points(
        contract_address=exercise_10_contract_address,
        secret_value_i_guess=secret_value,
        next_secret_value_i_chose=89,
    )

    return ()
end

@external
func call_ex_14_contract{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr}():
    let address = 1979510590566356355949737127225466958756749883817120849503018481540560420447
    ex14.claim_points(contract_address=address)
    return ()
end

# @external
# func transfer_contract_balance_to_wallet{
#     syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr
# }(address_to_transfer : felt, erc_20_token_address : felt):
#     let (current_contract_address) = get_contract_address()
#     let (balance) = IERC20.balanceOf(
#         contract_address=erc_20_token_address, account=current_contract_address
#     )
#     IERC20.transfer(
#         contract_address=erc_20_token_address, recipient=address_to_transfer, amount=balance
#     )

# return ()
# end
