require 'rails_helper'

RSpec.feature "pagetitle", type: :feature do
  describe "correct title" do
    context "home page" do
      let(:base_title) { "InstaClone" }
      before do
        visit root_path
      end

      it "returns home page title" do
        expect(page).to have_title "Home | #{base_title}"
      end
    end
  end
end
