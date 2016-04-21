require 'rails_helper'

RSpec.describe GroupTov, :type => :model do
    before { @group_tov = GroupTov.new(ctxt: "Мужская одежда", lvisible: true) }

    subject { @group_tov }

    it { should respond_to(:ctxt) }
    it { should respond_to(:lvisible) }
    it { should be_valid }

    describe "should not valid if empty ctxt" do
        before { @group_tov.ctxt = "" }
        
        it { should_not be_valid }
    end

end
