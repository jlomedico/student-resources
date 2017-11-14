require './bank_account.rb'

describe BankAccount do
  context "has a balance" do
    let(:account) do
      account = BankAccount.new(500, "Sarah")
    end

    it "is created with an opening balance and the name of the client" do
      expect(account).to be_a(BankAccount)
    end

    it "can report it's balance" do
      expect(account.balance).to eq(500)
    end
  end

  context "making a deposit" do
    let(:account) do
      account = BankAccount.new(500, "Sarah")
      account.deposit(500)
      account
    end

    it "balance is increased" do
      expect(account.balance).to eq(1000)
    end
  end

  context "making a withdrawal" do
    let(:account) do
      account = BankAccount.new(500, "Sarah")
      account.withdraw(200)
      account
    end

    it "balance is decreased" do
      expect(account.balance).to eq(300)
    end
  end

  context "transfering funds" do
    let(:account) do
      account = BankAccount.new(500, "Sarah")
    end

    let(:other_account) do
      other_account = BankAccount.new(1000, "Todd")
    end

    before :each do
      account.transfer(200, other_account)
    end

    it "account balance is decreased" do
      expect(account.balance).to eq(300)
    end

    it "other account balance is increased" do
      expect(other_account.balance).to eq(1200)
    end
  end

  context "minimum balance" do
    it "raises an error if opening balance is too low" do
      expect{ BankAccount.new(199, "Terry") }.to raise_error(ArgumentError)
    end

    it "does NOT raise an error if opening balance is over minimum balance" do
      expect{ BankAccount.new(201, "Terry") }.not_to raise_error
    end

    it "allows the bank owner to change the minimum balance" do
      BankAccount.minimum_balance = 100
      expect(BankAccount.minimum_balance).to eq(100)
    end
  end

end
