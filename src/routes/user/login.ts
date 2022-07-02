import { Static, Type } from '@sinclair/typebox';
import { FastifyInstance } from 'fastify';
import { prismaClient } from '../../prisma';
import {User} from '@prisma/client'
import _ from 'lodash';
const userWithoutId = Type.Object({
	username: Type.String(),
	phone: Type.String(),
	address: Type.String(),
    email: Type.String({ format: 'email' }),
	role:Type.String(),
});
type userWithoutId = Static<typeof userWithoutId>;

export default async function(app:FastifyInstance){
      
	app.route({
        method:'PUT',
        url:'/create',
        schema:{
            summary:'Create new photographer',
            tags:['User'],
            body:userWithoutId
        },
        handler: async (request,reply) =>{
            const user= request.body as User;
            await prismaClient.user.create({
                data: user
            })
        }
    });

    };