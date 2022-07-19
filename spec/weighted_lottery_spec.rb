RSpec.describe WeightedLottery do
  it "has a version number" do
    expect(WeightedLottery::VERSION).not_to be nil
  end

  describe "Random targets should appear in accordance with the dividend" do
    let(:items) do
      {
        "big_win" => 10,
        "win" => 20,
        "loose" => 70 
      }
    end
    context "win/loose appears more than big_win" do
      let(:result) {
        big_win, win, loose = [0, 0, 0]
        100.times do |i|
          case WeightedLottery.pick(items).to_sym
          when :big_win
            big_win += 1
          when :win
            win += 1
          when :loose
            loose += 1
          else
          end
        end
        {
          "big_win" => big_win,
          "win" => win,
          "loose" => loose
        }
      }

      it {expect(result["win"]).to be >= result["big_win"]}
      it {expect(result["loose"]).to be >= result["big_win"]}
    end
  end

end
