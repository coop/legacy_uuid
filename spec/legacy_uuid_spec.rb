require "spec_helper"

describe LegacyUUID do
  it "should generate predicatable UUIDs from a legacy uid" do
    uuid = LegacyUUID.from("au-123", prefix: "ehc1e64c")

    expected_uuid = "ehc1e64c-0001-4000-8000-00000000007b"

    expect(uuid).to eq(expected_uuid)
  end

  context ".from_campaign" do
    it "uses a prefinded prefix" do
      uuid = LegacyUUID.from_campaign("au-123")

      expected_uuid = "eda1e64c-0001-4000-8000-00000000007b"

      expect(uuid).to eq(expected_uuid)
    end
  end

  context ".from_charity" do
    it "uses a prefinded prefix" do
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
end
