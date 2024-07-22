use starknet::ContractAddress;

#[derive(Serde, Drop, Copy, PartialEq, Introspect)]
enum Color {
    White,
    Black,
    None,
}

#[dojo::model]
#[derive(Drop, Serde)]
struct Player {
    #[key]
    game_id: u32,
    #[key]
    address: ContractAddress,
    color: Color
}

// Currently, the dojo core generates a `GameTurnTrait` to expose the
// new model API functions.
// This may change in the future, but for now we need to change the trait
// name here.
#[generate_trait]
impl PlayerStateImpl of PlayerState {
    fn is_not_my_piece(self: @Player, piece_color: Color) -> bool {
        *self.color != piece_color
    }
}
