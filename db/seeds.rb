# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
quotes = [
    "You will not be punished for your anger, you will be punished by your anger.",
    "The mind is everything. What you think you become.",
    "Holding on to anger is like grasping a hot coal with the intent of throwing it at someone else; you are the one who gets burned.",
    "Three things cannot be long hidden: the sun, the moon, and the truth.",
    "Thousands of candles can be lighted from a single candle, and the life of the candle will not be shortened. Happiness never decreases by being shared.",
    "Do not dwell in the past, do not dream of the future, concentrate the mind on the present moment.",
    "Peace comes from within. Do not seek it without.",
    "No one saves us but ourselves. No one can and no one may. We ourselves must walk the path.",
    "We are shaped by our thoughts; we become what we think. When the mind is pure, joy follows like a shadow that never leaves.",
    "All that we are is the result of what we have thought."
  ]

quotes.each do |quote|
  Quote.create(content: quote, author: "Buddah")
end