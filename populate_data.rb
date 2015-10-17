File.delete('burgers_and_beers.db') if Dir['burgers_and_beers.db'].any?
exec('sqlite3 burgers_and_beers.db < data_setup.sql')

