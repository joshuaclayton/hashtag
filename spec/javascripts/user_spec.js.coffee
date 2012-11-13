describe 'User', ->
  describe '#fullName', ->
    it 'joins firstName and lastName', ->
      user = new User(first_name: 'John', last_name: 'Doe')
      expect(user.fullName()).toEqual('John Doe')

    it 'strips if lastName is not set', ->
      user = new User(first_name: 'John')
      expect(user.fullName()).toEqual('John')
