use starknet::{ContractAddress, ClassHash};


#[dojo::model]
#[derive(Copy, Drop, Serde)]
struct TimelockParams {
    #[key]
    target_selector: felt252,
    admin: ContractAddress,
    delay: u64,
}

#[dojo::model]
#[derive(Copy, Drop, Serde)]
struct PendingAdmin {
    #[key]
    target_selector: felt252,
    address: ContractAddress,
}

#[dojo::model]
#[derive(Copy, Drop, Serde)]
struct QueuedTransactions {
    #[key]
    target_selector: felt252,
    #[key]
    class_hash: ClassHash,
    queued: bool,
}
