require "spec_helper"

describe LegacyUUID do
  context ".from_campaign" do
    it "uses a predefined prefix" do
      uuid = LegacyUUID.from_campaign("au-123")

      expected_uuid = "eda1e64c-0001-4000-8000-00000000007b"

      expect(uuid).to eq(expected_uuid)
    end
  end

  context ".from_charity" do
    it "uses a predefined prefix" do
      uuid = LegacyUUID.from_charity("au-123")

      expected_uuid = "edb1e64c-0001-4000-8000-00000000007b"

      expect(uuid).to eq(expected_uuid)
    end

    it "treats gb and uk as the same" do
      gb_uuid = LegacyUUID.from_charity("gb-123")
      uk_uuid = LegacyUUID.from_charity("uk-123")

      expect(gb_uuid).to eq uk_uuid
    end
  end

  context ".from_page" do
    it "uses a predefined prefix" do
      uuid = LegacyUUID.from_page("au-123")

      expected_uuid = "edc1e64c-0001-4000-8000-00000000007b"

      expect(uuid).to eq(expected_uuid)
    end
  end

  context ".from_team" do
    it "uses a predefined prefix" do
      uuid = LegacyUUID.from_team("au-123")

      expected_uuid = "edd1e64c-0001-4000-8000-00000000007b"

      expect(uuid).to eq(expected_uuid)
    end
  end

  context ".from_organiser" do
    it "uses a predefined prefix" do
      uuid = LegacyUUID.from_organiser("au-123")

      expected_uuid = "eac1e64c-0001-4000-8000-00000000007b"

      expect(uuid).to eq(expected_uuid)
    end
  end

  context ".from_offline_donation" do
    it "uses a predefined prefix" do
      uuid = LegacyUUID.from_offline_donation("au-123")

      expected_uuid = "ead1e64c-0001-4000-8000-00000000007b"

      expect(uuid).to eq(expected_uuid)
    end
  end

  it "can reverse things" do
    gb_uuid = LegacyUUID.from_charity("gb-123")

    expect(LegacyUUID.type_of(gb_uuid)).to eq :charity
    expect(LegacyUUID.uid_of(gb_uuid)).to eq "gb-123"
  end
end
