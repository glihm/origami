use chess::models::player::Color;
use starknet::ContractAddress;

#[dojo::model]
#[derive(Drop, Serde)]
struct Game {
    #[key]
    game_id: u32,
    winner: Color,
    white: ContractAddress,
    black: ContractAddress
}

#[dojo::model]
#[derive(Drop, Serde)]
struct GameTurn {
    #[key]
    game_id: u32,
    player_color: Color
}

// Currently, the dojo core generates a `GameTurnTrait` to expose the
// new model API functions.
// This may change in the future, but for now we need to change the trait
// name here.
#[generate_trait]
impl GameTurnSequenceImpl of GameTurnSequence {
    fn next_turn(self: @GameTurn) -> Color {
        match self.player_color {
            Color::White => Color::Black,
            Color::Black => Color::White,
            Color::None => panic(array!['Illegal turn'])
        }
    }
}
