import {
  intArg,
  makeSchema,
  nonNull,
  objectType,
  inputObjectType,
  arg,
  asNexusMethod,
  enumType,
} from 'nexus'
import bcrypt from 'bcrypt'
import { DateTimeResolver } from 'graphql-scalars'
import { User, Follows, Event } from 'nexus-prisma'

export const DateTime = asNexusMethod(DateTimeResolver, 'date')

const Query = objectType({
  name: 'Query',
  definition(t) {
    t.nonNull.list.nonNull.field('allUsers', {
      type: 'User',
      resolve: async (_parent, _args, context, _info) => {
        const users = await context.prisma.user.findMany()
        return users
      },
    })

    t.nullable.field('eventById', {
      type: 'Event',
      args: {
        id: nonNull(intArg()),
      },
      resolve: async (_parent, args, context, _info) => {
        const event = await context.prisma.event.findUnique({
          where: { id: args.id || undefined },
        })
        return event
      },
    })
  },
})

const Mutation = objectType({
  name: 'Mutation',
  definition(t) {
    t.nonNull.field('signupUser', {
      type: 'User',
      args: {
        data: nonNull(
          arg({
            type: 'UserCreateInput',
          }),
        ),
      },
      resolve: async (_, args, context, _info) => {
        try {
          const password = await bcrypt.hash(args.data.password, 10)
          const user = await context.prisma.user.create({
            data: {
              username: args.data.username,
              email: args.data.email,
              firstname: args.data.firstname,
              lastname: args.data.lastname,
              birthdate: args.data.birthdate,
              password: password,
            },
          })
          return user
        } catch (e) {
          throw e
        }
      },
    })
  },
})

const UserType = objectType({
  name: User.$name,
  definition(t) {
    t.field(User.id)
    t.field(User.email)
    t.field(User.password)
    t.field(User.username)
    t.field(User.firstname)
    t.field(User.lastname)
    t.field(User.birthdate)
    t.field(User.confirmed)
    t.field(User.created_at)
    t.field(User.events)
    t.field(User.followers)
    t.field(User.following)
  },
})

const EventType = objectType({
  name: Event.$name,
  definition(t) {
    t.field(Event.id)
    t.field(Event.created_at)
    t.field(Event.title)
    t.field(Event.content)
    t.field(Event.published)
    t.field(Event.author)
    t.field(Event.author_id)
    t.field(Event.visibility)
  },
})

const EnumVisibility = enumType({
  name: 'EnumVisibility',
  members: ['PUBLIC', 'PRIVATE'],
})

const UserCreateInput = inputObjectType({
  name: 'UserCreateInput',
  definition(t) {
    t.nonNull.string('email')
    t.nonNull.string('password')
    t.nonNull.string('username')
    t.nonNull.string('firstname')
    t.nonNull.string('lastname')
    t.nonNull.date('birthdate')
  },
})


const EventCreateInput = inputObjectType({
  name: 'EventCreateInput',
  definition(t) {
    t.nonNull.string('title')
    t.nonNull.string('content')
  },
})

const FollowsType = objectType({
  name: Follows.$name,
  definition(t) {
    t.field(Follows.follower_id)
    t.field(Follows.following_id)
    t.field(Follows.created_at)
  },
})

const SortOrder = enumType({
  name: 'SortOrder',
  members: ['asc', 'desc'],
})


const UserUniqueInput = inputObjectType({
  name: 'UserUniqueInput',
  definition(t) {
    t.int('id')
    t.string('email')
  },
})

export const schema = makeSchema({
  types: [
    Query,
    Mutation,
    UserType,
    EventType,
    FollowsType,
    UserCreateInput,
    EventCreateInput,
    EnumVisibility,
    SortOrder,
    UserUniqueInput,
    DateTime
  ],
  outputs: {
    schema: __dirname + '/generated/schema.graphql',
    typegen: __dirname + '/generated/typings.ts',
  },
  contextType: {
    module: require.resolve('./context'),
    export: 'Context',
  },
  sourceTypes: {
    modules: [
      {
        module: '@prisma/client',
        alias: 'prisma',
      },
    ],
  },
})
