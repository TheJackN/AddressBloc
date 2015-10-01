require_relative '../models/address_book'

RSpec.describe AddressBook do

  let(:book) { AddressBook.new}

  def check_entry(entry, expected_name, expected_number, expected_email)
    expect(entry.name).to eq(expected_name)
    expect(entry.phone_number).to eq expected_number
    expect(entry.email).to eq(expected_email)
  end

  describe "attributes" do
    it "should respond to entries" do
      expect(book).to respond_to(:entries)
    end

    it "should initialize entries as an array" do
      expect(book.entries).to be_a(Array)
    end

    it "should initialze entires as empty" do
      expect(book.entries.size).to eq(0)
    end
  end

  describe "add entry" do
    it "adds only one entry to the address book" do
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expect(book.entries.size).to eq(1)
    end

    it "adds the correct information to entries" do
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      new_entry = book.entries[0]

      expect(new_entry.name).to eq('Ada Lovelace')
      expect(new_entry.phone_number).to eq('010.012.1815')
      expect(new_entry.email).to eq('augusta.king@lovelace.com')
    end
  end

  describe "#remove entry" do
    it "removes the correct entry from the address book" do
      book.add_entry('Jon Mahone', '112.123.1234', 'Jonjon@jon.jon')

      name = 'Ada Lovelace'
      phone_number = '010.012.12815'
      email = 'augusta.king@lovelace.com'
      book.add_entry(name, phone_number, email)

      expect(book.entries.size).to eq(2)
      book.remove_entry(name, phone_number, email)
      expect(book.entries.size).to eq(1)
      expect(book.entries.first.name).to eq('Jon Mahone')
    end
  end

  describe "#import_from_csv" do
    it "imports the correct number of entries" do
      book.import_from_csv("entries.csv")
      book_size = book.entries.size

      expect(book_size).to eq(5)
    end

    it "imports the correct number of entries from a second file" do
      book.import_from_csv("entries_2.csv")
      book_size = book.entries.size

      expect(book_size).to eq(4)
    end

    it "imports the 1st entry" do
      book.import_from_csv("entries.csv")
      entry_one = book.entries[0]

      check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
    end

    it "imports the 1st entry from a second file" do
      book.import_from_csv("entries_2.csv")
      entry_one = book.entries[0]

      check_entry(entry_one, "Alex", "333-333-3333", "alex@alexland.com")
    end

    it "imports the 2nd entry" do
      book.import_from_csv("entries.csv")
      entry_two = book.entries[1]

      check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
    end

    it "imports the 2nd entry from a second file" do
      book.import_from_csv("entries_2.csv")
      entry_two = book.entries[1]

      check_entry(entry_two, "Dave", "222-222-2222", "dave@daveland.com")
    end

    it "imports the 3rd entry" do
      book.import_from_csv("entries.csv")
      entry_three = book.entries[2]

      check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")
    end

    it "imports the 3rd entry from a second file" do
      book.import_from_csv("entries_2.csv")
      entry_three = book.entries[2]

      check_entry(entry_three, "Jen", "444-444-4444", "jen@jenland.com")
    end

    it "imports the 4th entry" do
      book.import_from_csv("entries.csv")
      entry_four = book.entries[3]

      check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")
    end

    it "imports the 4th entry from a second file" do
      book.import_from_csv("entries_2.csv")
      entry_four = book.entries[3]

      check_entry(entry_four, "Mary", "777-777-7777", "mary@maryland.com")
    end

    it "imports the 5th entry" do
      book.import_from_csv("entries.csv")
      entry_five = book.entries[4]

      check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")
    end
  end


end
