require 'rails_helper' 
describe UserRank do
  it 'returns the correct rank and message' do
    result = UserRank.rank(101)
    expect(result[:rank]).to eq("Absolutely Amazing")
    expect(result[:text]).to include("408")

    result = UserRank.rank(90)
    expect(result[:rank]).to eq("Game-Changer")
    expect(result[:text]).to include("app")

    result = UserRank.rank(50)
    expect(result[:rank]).to eq("Superb")
    expect(result[:text]).to include("friend")

    result = UserRank.rank(20)
    expect(result[:rank]).to eq("Journeyman")
    expect(result[:text]).to include("more")

    result = UserRank.rank(5)
    expect(result[:rank]).to eq("Novice")
    expect(result[:text]).to include("better")
  end
end
